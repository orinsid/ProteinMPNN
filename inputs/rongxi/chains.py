import argparse
from pyrosetta import *
import datetime as dt
from pyrosetta.rosetta.protocols.rosetta_scripts import *
import os
parser = argparse.ArgumentParser() ## 新建参数解释器对象
parser.add_argument('--pdb') ## 添加参数
args = parser.parse_args()### 参数赋值，也可以通过终端赋值
def symm(pdb):
    init()
    pose = pose_from_pdb(f'{pdb}')
    xml = pyrosetta.rosetta.protocols.rosetta_scripts.XmlObjects.create_from_string('''
    <MOVERS>
        <SetupForSymmetry name='setup_symm' definition='C18.sym'/>
    </MOVERS>
    <PROTOCOLS>   
        <Add mover_name='setup_symm'/>
        
    </PROTOCOLS>
    ''')
    parser = RosettaScriptsParser()
    protocol = xml.get_mover('ParsedProtocol')
    protocol.apply(pose)
    pose.dump_pdb(f'/mnt/d/ProteinMPNN/inputs/rongxi/outputs/C9-{pdb}')

if __name__ == '__main__':
    symm(args.pdb) ## 带参数
