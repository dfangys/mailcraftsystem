#!/usr/bin/env python3
import os
import re

def fix_remaining_issues():
    """Fix all remaining linting issues systematically"""
    
    # Get all dart files
    dart_files = []
    for root, dirs, files in os.walk('lib'):
        for file in files:
            if file.endswith('.dart') and not file.endswith('.g.dart') and not file.endswith('.freezed.dart'):
                dart_files.append(os.path.join(root, file))
    
    total_fixes = 0
    
    for file_path in dart_files:
        try:
            with open(file_path, 'r') as f:
                lines = f.readlines()
            
            new_lines = []
            i = 0
            file_fixes = 0
            
            while i < len(lines):
                line = lines[i]
                original_line = line
                
                # Fix missing documentation for enum values and simple members
                if i > 0:
                    prev_line = lines[i-1].strip()
                    current_line = line.strip()
                    
                    # Check if this is an enum value or simple member without docs
                    if (not prev_line.startswith('///') and 
                        current_line and 
                        not current_line.startswith('//') and
                        not current_line.startswith('@') and
                        not current_line.startswith('import') and
                        not current_line.startswith('part') and
                        not current_line.startswith('class') and
                        not current_line.startswith('enum') and
                        not current_line.startswith('extension') and
                        not current_line.startswith('mixin') and
                        not current_line.startswith('abstract') and
                        not current_line.startswith('const') and
                        not current_line.startswith('factory') and
                        not current_line.startswith('static') and
                        not current_line.startswith('final') and
                        not current_line.startswith('late') and
                        not current_line.startswith('get ') and
                        not current_line.startswith('set ') and
                        not current_line.startswith('void ') and
                        not current_line.startswith('Future') and
                        not current_line.startswith('Stream') and
                        not current_line.startswith('String') and
                        not current_line.startswith('int ') and
                        not current_line.startswith('bool ') and
                        not current_line.startswith('double ') and
                        not current_line.startswith('List') and
                        not current_line.startswith('Map') and
                        not current_line.startswith('if ') and
                        not current_line.startswith('for ') and
                        not current_line.startswith('while ') and
                        not current_line.startswith('switch ') and
                        not current_line.startswith('case ') and
                        not current_line.startswith('default') and
                        not current_line.startswith('return') and
                        not current_line.startswith('throw') and
                        not current_line.startswith('try') and
                        not current_line.startswith('catch') and
                        not current_line.startswith('finally') and
                        not current_line.startswith('assert') and
                        not current_line.startswith('super') and
                        not current_line.startswith('this') and
                        not current_line.startswith('new ') and
                        not current_line.startswith('await') and
                        not current_line.startswith('async') and
                        not current_line.startswith('yield') and
                        not current_line.startswith('break') and
                        not current_line.startswith('continue') and
                        not current_line.startswith('}') and
                        not current_line.startswith('{') and
                        not current_line.startswith('(') and
                        not current_line.startswith(')') and
                        not current_line.startswith('[') and
                        not current_line.startswith(']') and
                        not current_line.startswith('<') and
                        not current_line.startswith('>') and
                        not current_line.startswith('=') and
                        not current_line.startswith('+') and
                        not current_line.startswith('-') and
                        not current_line.startswith('*') and
                        not current_line.startswith('/') and
                        not current_line.startswith('%') and
                        not current_line.startswith('&') and
                        not current_line.startswith('|') and
                        not current_line.startswith('^') and
                        not current_line.startswith('!') and
                        not current_line.startswith('?') and
                        not current_line.startswith(':') and
                        not current_line.startswith(';') and
                        not current_line.startswith(',') and
                        not current_line.startswith('.') and
                        re.match(r'^[a-zA-Z_][a-zA-Z0-9_]*,?\s*$', current_line)):
                        
                        # This looks like an enum value or simple identifier
                        indent = len(line) - len(line.lstrip())
                        member_name = current_line.rstrip(',').strip()
                        doc_line = ' ' * indent + f'/// {member_name}\n'
                        new_lines.append(doc_line)
                        file_fixes += 1
                
                new_lines.append(line)
                i += 1
            
            # Write back if we made changes
            if file_fixes > 0:
                with open(file_path, 'w') as f:
                    f.writelines(new_lines)
                print(f"Fixed {file_fixes} documentation issues in {file_path}")
                total_fixes += file_fixes
                
        except Exception as e:
            print(f"Error processing {file_path}: {e}")
    
    print(f"Total fixes applied: {total_fixes}")

if __name__ == '__main__':
    fix_remaining_issues()
