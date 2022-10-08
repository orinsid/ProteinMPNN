arr=(pdb)

findargs=()

for t in "${arr[@]}"; do
    findargs+=(-name "*.$t" -o)
done

find . -type f \( "${findargs[@]}" -false \)