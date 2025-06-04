# Dotfiles Repository

## Instructions

1. Install prerequisites

```
git
github-cli
stow
```

2. If the GitHub CLI has not been authenticated, run the following and follow
   the instructions.

```
gh auth login
```

3. Clone the repository and execute stow

```
gh repo clone ryanf9802/dotfiles ~/dotfiles && cd ~/dotfiles && stow .
```
