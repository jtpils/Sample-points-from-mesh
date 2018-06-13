%sample n point from point

file = 'chair_0027.off';
[verts,faces,comments] = readoffmesh(file);
n = 3000;   
[points, normals, curvatures, map] = sample_mesh(verts, faces, n, 0, {'uniform'});

target_file = 'b0_points.off';

%add head to generate complete .off file
fid = fopen(target_file,'w');
fprintf(fid,'%s\n','OFF');
fprintf(fid,'%d %d %d\n',n,0,0);
fclose(fid);

%add vertices
dlmwrite(target_file,points,'-append','delimiter',' ')