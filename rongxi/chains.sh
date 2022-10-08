cd /mnt/d/ProteinMPNN/inputs/rongxi
fileList=`ls $1`
for fileName in $fileList
do
    if [ "${fileName##*.}"x = "pdb"x ];then
        sed -i 's/^\(ATOM.\{17\}\)B/\1A/' $fileName
        sed -i 's/^\(ATOM.\{17\}\)D/\1C/' $fileName
        sed -i 's/^\(ATOM.\{17\}\)F/\1E/' $fileName
    fi
done
for fileName in $fileList
do
    if [ "${fileName##*.}"x = "pdb"x ];then
        sed -i 's/^\(ATOM.\{17\}\)C/\1B/' $fileName
        sed -i 's/^\(ATOM.\{17\}\)E/\1C/' $fileName
        sed -i 's/TER//1m' $fileName
        echo "$fileName has done!"
    fi
done
#conda activate pyrosetta
#cd /mnt/d/ProteinMPNN/inputs/rongxi
for fileName in $fileList
do
    if [ "${fileName##*.}"x = "pdb"x ];then
        python chains.py --pdb=$fileName
    fi
done