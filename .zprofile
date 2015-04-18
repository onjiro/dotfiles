
PATH=.:$PATH

# node nvm coffee
if [ -e ~/.nvm/nvm.sh ]; then
  source ~/.nvm/nvm.sh
  nvm use stable
fi
