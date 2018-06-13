function pcloud = pcloud_from_mesh(np, density_dist, filename)
% pcloud_from_mesh creates a point cloud from  a mesh
%
% filename = path to the mesh file
% np = number of points to sample
% density_dist = sample density distribution

    pcloud = struct;
    
    [~,~,fext] = fileparts(filename);
    if strcmp(fext,'.off')
        [vertices,faces] = readoffmesh(filename);
    else
        error(['Unsupported file ending ',fext]);
    end

    %use_curvature = 1;
    use_curvature = 0;  %we can set it to 0 if we only use the points
    [pcloud.points, pcloud.normals, pcloud.curvatures, ~] = sample_mesh(vertices, faces, np, use_curvature, density_dist);
end
