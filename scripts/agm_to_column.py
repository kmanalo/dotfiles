#!/usr/bin/env python3

flux_array=[]
with open('flux.agm','r') as f:
  for line in f:
    if 'mat' in line:
       pass
    else:
       flux_array.append(line.split())

agm_f=open('graph.agm','w')

# print the header info
print("grp",end=" ",file=agm_f)
for j in range(len(flux_array)):
  mat=j+1
  print("m"+str(mat),end=" ",file=agm_f)
print(file=agm_f)

# print the transpose of the agm data
for i in range(len(flux_array[0])):
  grp=i+1
  print(grp,end=" ",file=agm_f)
  for j in range(len(flux_array)):
    print(flux_array[j][i],end=" ",file=agm_f)
  print(file=agm_f)

agm_f.close()
