# git-multi-remote-setup

A Bash helper that:

- Initializes a Git repo if one doesn’t exist.  
- Accepts **one or more** remote URLs.  
- Infers `github` vs. `gitlab` from each URL (case-insensitive).  
- Adds those remotes by name.  
- Creates an `origin` remote configured **push-only** to **all** URLs.  
- Wires your current branch so:
  - `git pull`  → pulls from `github/<branch>`
  - `git push`  → pushes to **all** remotes via `origin`

---

## Installation

**With Make** (recommended):
```bash
cd git-multi-remote-setup
sudo make install
```

*Makefile* (`install` target) copies the script to `/usr/local/bin`.

**Without Make**:
```bash
cd git-multi-remote-setup
sudo cp git-multi-remote-setup /usr/local/bin/
```

Ensure `/usr/local/bin` is in your `$PATH`.

---

## Usage

```bash
# Single remote:
git-multi-remote-setup git@github.com:m-a-r-o-u/your-repo.git

# Two remotes:
git-multi-remote-setup \
  git@github.com:m-a-r-o-u/your-repo.git \
  git@gitlab.lrz.de:group/project.git

# Any number:
git-multi-remote-setup <url1> <url2> [url3…]
```

Afterwards:

```bash
git pull    # → pulls from github/<branch>
git push    # → pushes to all URLs via origin
```

To pull directly from GitLab (or another named remote):
```bash
git pull gitlab main
```

3. **Origin**
   - Adds (if missing) an `origin` placeholder pointing at the **first** URL.
   - **Leaves** its fetch URL alone (harmless, since you’ll pull from `github`).
   - **Adds** all URLs as push URLs on `origin`.

