| Requirements                                            |
|---------------------------------------------------------|
| [tar](https://man7.org/linux/man-pages/man1/tar.1.html) |
| [git](https://git-scm.com/)                             |
| [age](https://github.com/FiloSottile/age)               |

## Usage

`Pull` script fetch newest data from remote and decrypt and dearchive to obsidian vault

`Push` scrip archive obsidian vault, encrypt it and commit in git repository

### Setup required

- `~/Documents/apocrypta-global` directories
- `~/Documents/apocrypta-global/apocrypta-vault` as obsidian vault
- `~/Documents/apocrypta-global/apocrypta` as repository to store encrypted archive
- `~/Documents/apocrypta-global/apocrypta-key` secret and public key from age-keygen
