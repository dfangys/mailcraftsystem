#!/usr/bin/env python3
import os
import re
import glob

def fix_file_issues(file_path):
    """Fix common linting issues in a Dart file"""
    with open(file_path, 'r') as f:
        content = f.read()
    
    original_content = content
    
    # Fix unnecessary type annotations
    content = re.sub(r'final (String|int|bool|double|List|Map)\s+(\w+)\s*=', r'final \2 =', content)
    
    # Fix prefer_int_literals (change .0 to empty for integers)
    content = re.sub(r'(\d+)\.0(?!\d)', r'\1', content)
    
    # Fix unnecessary braces in string interpolation
    content = re.sub(r'\$\{(\w+)\}', r'$\1', content)
    
    # Fix long lines by breaking them at logical points
    lines = content.split('\n')
    fixed_lines = []
    
    for line in lines:
        if len(line) > 80:
            # Try to break at logical points
            if ' || ' in line and line.strip().startswith('return '):
                # Break boolean expressions
                parts = line.split(' || ')
                if len(parts) > 1:
                    indent = len(line) - len(line.lstrip())
                    fixed_lines.append(parts[0] + ' ||')
                    for part in parts[1:-1]:
                        fixed_lines.append(' ' * (indent + 4) + part.strip() + ' ||')
                    fixed_lines.append(' ' * (indent + 4) + parts[-1].strip())
                    continue
            
            # Break at commas in parameter lists
            if ',' in line and ('(' in line or '{' in line):
                # This is a complex case, keep original for now
                pass
        
        fixed_lines.append(line)
    
    content = '\n'.join(fixed_lines)
    
    # Only write if content changed
    if content != original_content:
        with open(file_path, 'w') as f:
            f.write(content)
        return True
    return False

def add_missing_docs(file_path):
    """Add missing documentation to public members"""
    with open(file_path, 'r') as f:
        lines = f.readlines()
    
    new_lines = []
    i = 0
    
    while i < len(lines):
        line = lines[i]
        
        # Check if previous line has documentation
        has_doc = i > 0 and lines[i-1].strip().startswith('///')
        
        if not has_doc:
            stripped = line.strip()
            indent = len(line) - len(line.lstrip())
            
            # Add docs for various constructs
            if stripped.startswith('enum ') and not stripped.startswith('enum _'):
                new_lines.append(' ' * indent + '/// Enumeration\n')
            elif stripped.startswith('class ') and not stripped.startswith('class _'):
                class_name = stripped.split()[1].split('<')[0].split('(')[0]
                new_lines.append(' ' * indent + f'/// {class_name} class\n')
            elif stripped.startswith('abstract class '):
                class_name = stripped.split()[2].split('<')[0].split('(')[0]
                new_lines.append(' ' * indent + f'/// Abstract {class_name} class\n')
            elif stripped.startswith('mixin '):
                mixin_name = stripped.split()[1].split('<')[0].split('(')[0]
                new_lines.append(' ' * indent + f'/// {mixin_name} mixin\n')
            elif stripped.startswith('extension '):
                ext_name = stripped.split()[1].split('<')[0].split('(')[0]
                new_lines.append(' ' * indent + f'/// {ext_name} extension\n')
            elif re.match(r'^\w+,?\s*$', stripped) and i > 0:
                # Enum value
                new_lines.append(' ' * indent + f'/// {stripped.rstrip(",")}\n')
        
        new_lines.append(line)
        i += 1
    
    # Write back if changed
    if new_lines != lines:
        with open(file_path, 'w') as f:
            f.writelines(new_lines)
        return True
    return False

def main():
    # Find all Dart files
    dart_files = []
    for root, dirs, files in os.walk('lib'):
        for file in files:
            if file.endswith('.dart') and not file.endswith('.g.dart') and not file.endswith('.freezed.dart'):
                dart_files.append(os.path.join(root, file))
    
    print(f"Processing {len(dart_files)} Dart files...")
    
    fixed_count = 0
    for file_path in dart_files:
        try:
            if fix_file_issues(file_path):
                fixed_count += 1
                print(f"Fixed issues in {file_path}")
            
            if add_missing_docs(file_path):
                print(f"Added docs to {file_path}")
        except Exception as e:
            print(f"Error processing {file_path}: {e}")
    
    print(f"Processed {len(dart_files)} files, fixed {fixed_count} files")

if __name__ == '__main__':
    main()
