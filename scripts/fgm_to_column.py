#!/usr/bin/env python3

print("script converts flux.fgm to column format in graph.fgm file")

flux_array=[]
with open('flux.fgm','r') as f:
  for line in f:
    if 'mat' in line:
       pass
    else:
       flux_array.append(line.split())

fgm_f=open('graph.fgm','w')

# print the header info
print("grp",end=" ",file=fgm_f)
for j in range(len(flux_array)):
  mat=j+1
  print("m"+str(mat),end=" ",file=fgm_f)
print(file=fgm_f)

# print the transpose of the fgm data
for i in range(len(flux_array[0])):
  grp=i+1
  print(grp,end=" ",file=fgm_f)
  for j in range(len(flux_array)):
    print(flux_array[j][i],end=" ",file=fgm_f)
  print(file=fgm_f)

fgm_f.close()
