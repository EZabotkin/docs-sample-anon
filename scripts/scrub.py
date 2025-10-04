import sys, pathlib, re

REPLACEMENTS = [
    (r'\bIONOS\b', 'the Platform'),
    (r'https?://[^ )\n]+', 'https://example.invalid'),
]

def scrub_text(text):
    for pattern, repl in REPLACEMENTS:
        text = re.sub(pattern, repl, text)
    return text

def main():
    root = pathlib.Path('docs')
    for p in root.rglob('*.md'):
        content = p.read_text(encoding='utf-8')
        new = scrub_text(content)
        if new != content:
            p.write_text(new, encoding='utf-8')
            print(f'Scrubbed: {p}')

if __name__ == '__main__':
    main()
