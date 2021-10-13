echo "Pulling latest changes from $remote/$repo $branch branch"
if [ "$remote" != "dapr" ]; then
  git config advice.detachedHead false
  git remote add fork -f "https://github.com/$remote/$repo.git"
  git fetch --all
  git checkout fork/$branch
  git reset --hard fork/$branch
  git pull --rebase fork $branch
else
  git fetch --all
  git checkout origin/$branch
  git pull --rebase origin $branch
fi
/bin/bash
