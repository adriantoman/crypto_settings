REMOTE=`git config remote.origin.url`
if [[ "$REMOTE" == */ms_projects* ]]; then
    read -p "Please insert git encryption password located in PassWord Manager git-crypto resource: " PASSWORD
    echo "$PASSWORD" > ~/.ssh/git_pass

    git config filter.openssl.clean crypto/clean_filter_openssl
    git config filter.openssl.smudge crypto/smudge_filter_openssl
    git config diff.openssl.textconv crypto/diff_filter_openssl
    git config diff.openssl.cachetextconv true

else
  cat <<EOF 
  o              o        o           o__ __o         o          o   __o__   o          o        o__ __o     
  <|>            <|>      <|>         <|     v\       <|\        <|>    |    <|\        <|>      /v     v\    
  / \            / \      / \         / \     <\      / \\o      / \   / \   / \\o      / \     />       <\   
  \o/            \o/    o/   \o       \o/     o/      \o/ v\     \o/   \o/   \o/ v\     \o/   o/              
    |              |    <|__ __|>       |__  _<|        |   <\     |     |     |   <\     |   <|       _\__o__ 
  < >            < >   /       \       |       \      / \    \o  / \   < >   / \    \o  / \   \\          |   
    \o    o/\o    o/  o/         \o    <o>       \o    \o/     v\ \o/    |    \o/     v\ \o/     \         /   
    v\  /v  v\  /v  /v           v\    |         v\    |       <\ |     o     |       <\ |       o       o    
      <\/>    <\/>  />             <\  / \         <\  / \        < \  __|>_  / \        < \      <\__ __/>    
  
  YOU NEED TO RUN THIS SCRIPT IN MS_PROJECT FOLDER (folder where you have cloned MS_PROJECT Git repository)
EOF
fi
