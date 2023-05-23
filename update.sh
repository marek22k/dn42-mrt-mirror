
rm mrt.collector.dn42/*.html
rm mrt.collector.dn42/*/*.html
rm mrt.collector.dn42/*/*/*.html
# Try to mirror the newest files
if wget --mirror --recursive --convert-links --page-requisites --level=3 -D mrt.collector.dn42 --tries=5 --continue --timeout=10 --waitretry=60 --prefer-family=IPv4 --retry-connrefused --local-encoding=UTF-8 --compression=auto --secure-protocol=TLSv1_3 https://mrt.collector.dn42/; then
    # Add the files to git
    # Exlude html files and the latest dump
    git add mrt.collector.dn42/20*/*/master*.mrt.bz2
    
    # Save files
    git commit -m "Update dumps"
    
    # Push the files to GitHub
    git push origin main
else
    echo "Failed to mirror. Please investigate."
fi
# git add mrt.collector.dn42/20*/*/master*.mrt.bz2
