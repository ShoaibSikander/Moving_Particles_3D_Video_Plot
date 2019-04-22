filename = 'Three_Dimensional_Plot.xlsx';                               % Define the name of Excel File
file = xlsread(filename);                                               % Import Excel File
droplet_magnification_factor=1;                                         % How much larger you want to show droplet

total_Frames = length(file);                                            % Find the total number of frames
disp('Total Frames');                                                   % Display Total Number of Frames                                                   
disp(total_Frames);                                                     % Display Total Number of Frames

firstX = file(:,5);                                                     % Read the X-coord. of 1st Droplet from Excel File
firstY = file(:,6);                                                     % Read the Y-coord. of 1st Droplet from Excel File
firstZ = file(:,7);                                                     % Read the Z-coord. of 1st Droplet from Excel File
secondX = file(:,14);                                                   % Read the X-coord. of 2nd Droplet from Excel File
secondY = file(:,15);                                                   % Read the Y-coord. of 2nd Droplet from Excel File
secondZ = file(:,16);                                                   % Read the Z-coord. of 2nd Droplet from Excel File
firstDia = file(:,8);                                                   % Read the Diameter of 1st Droplet from Excel File
secondDia = file(:,17);                                                 % Read the Diameter of 2nd Droplet from Excel File
time = file(:,1);                                                       % Read the Time Steps from Excel File
flame_Dia_First = file(:,10);                                           % Read the Diameter of flame around 1st Droplet from Excel File 
flame_Dia_Second = file(:,19);                                          % Read the Diameter of flame around 2nd Droplet from Excel File

min_X_1 = min(firstX);                                                  % Minimum Value in the X-coord. of 1st Droplet
max_X_1 = max(firstX);                                                  % Maximum Value in the X-coord. of 1st Droplet
min_Y_1 = min(firstY);                                                  % Minimum Value in the Y-coord. of 1st Droplet
max_Y_1 = max(firstY);                                                  % Maximum Value in the Y-coord. of 1st Droplet
min_Z_1 = min(firstZ);                                                  % Minimum Value in the Z-coord. of 1st Droplet
max_Z_1 = max(firstZ);                                                  % Maximum Value in the Z-coord. of 1st Droplet

min_X_2 = min(secondX);                                                 % Minimum Value in the X-coord. of 2nd Droplet
max_X_2 = max(secondX);                                                 % Maximum Value in the X-coord. of 2nd Droplet
min_Y_2 = min(secondY);                                                 % Minimum Value in the Y-coord. of 2nd Droplet
max_Y_2 = max(secondY);                                                 % Maximum Value in the Y-coord. of 2nd Droplet
min_Z_2 = min(secondZ);                                                 % Minimum Value in the Z-coord. of 2nd Droplet
max_Z_2 = max(secondZ);                                                 % Maximum Value in the Z-coord. of 2nd Droplet


min_X = min(min_X_1, min_X_2);                                          % Minimum Value among Drop-1 & Drop-2 X-coord.
max_X = max(max_X_1, max_X_2);                                          % Maximum Value among Drop-1 & Drop-2 X-coord.
min_Y = min(min_Y_1, min_Y_2);                                          % Minimum Value among Drop-1 & Drop-2 Y-coord.
max_Y = max(max_Y_1, max_Y_2);                                          % Maximum Value among Drop-1 & Drop-2 Y-coord.
min_Z = min(min_Z_1, min_Z_2);                                          % Minimum Value among Drop-1 & Drop-2 Z-coord.
max_Z = max(max_Z_1, max_Z_2);                                          % Maximum Value among Drop-1 & Drop-2 Z-coord.

limit_X_min = min_X-150;                                                 % Define minimum point less than 50 points of minimum
limit_X_max = max_X+150;                                                 % Define maximum point more than 50 points of maximum
limit_Y_min = min_Y-150;                                                 % Define minimum point less than 50 points of minimum
limit_Y_max = max_Y+150;                                                 % Define maximum point more than 50 points of maximum
limit_Z_min = min_Z-150;                                                 % Define minimum point less than 50 points of minimum
limit_Z_max = max_Z+150;                                                 % Define maximum point more than 50 points of maximum

workingDir = '3D_images';% Define directory to store 3D plots
disp('Current Frame:');                                                 % To display current frame
% f = figure('visible','off');
figure('units','normalized','outerposition',[0 0 1 1], 'visible','off');% To make the figure fit the full size of laptop screen
for i=1:total_Frames-4                                                  % start the loop
    sample_point= i;                                                    % current sample = current value of loop
    first_current_X = firstX(sample_point,1);                           % X-coord. of 1st drop in current frame
    first_current_Y = firstY(sample_point,1);                           % Y-coord. of 1st drop in current frame
    first_current_Z = firstZ(sample_point,1);                           % Z-coord. of 1st drop in current frame
    first_dia = firstDia(sample_point,1)*droplet_magnification_factor;  % Diameter of 1st drop in current frame 
    second_current_X = secondX(sample_point,1);                         % X-coord. of 2nd drop in current frame                         
    second_current_Y = secondY(sample_point,1);                         % Y-coord. of 2nd drop in current frame
    second_current_Z = secondZ(sample_point,1);                         % Z-coord. of 2nd drop in current frame
    second_dia = secondDia(sample_point,1)*droplet_magnification_factor;% Diameter of 2nd drop in current frame

    first_next_X = firstX(sample_point+4,1);                            % X-coord. of 1st drop in next frame
    first_next_Y = firstY(sample_point+4,1);                            % Y-coord. of 1st drop in next frame
    first_next_Z = firstZ(sample_point+4,1);                            % Z-coord. of 1st drop in next frame
    second_next_X = secondX(sample_point+4,1);                          % X-coord. of 2nd drop in next frame
    second_next_Y = secondY(sample_point+4,1);                          % Y-coord. of 2nd drop in next frame
    second_next_Z = secondZ(sample_point+4,1);                          % Z-coord. of 2nd drop in next frame
   
    time_current = time(sample_point,1);                                % Value of time in current frame
    time_next = time(sample_point+4,1);                                 % Value of time in next frame
    
    difference_first_X = (first_next_X - first_current_X);              % Distance covered per frame by 1st Droplet along X-direction
    difference_first_Y = (first_next_Y - first_current_Y);              % Distance covered per frame by 1st Droplet along Y-direction
    difference_first_Z = (first_next_Z - first_current_Z);              % Distance covered per frame by 1st Droplet along Z-direction

    difference_second_X = (second_next_X - second_current_X);           % Distance covered per frame by 2nd Droplet along X-direction
    difference_second_Y = (second_next_Y - second_current_Y);           % Distance covered per frame by 2nd Droplet along Y-direction
    difference_second_Z = (second_next_Z - second_current_Z);           % Distance covered per frame by 2nd Droplet along Z-direction   
    
    time_difference = time_next-time_current;                           % Value of Time difference in current and next frame
    
    speed_first_X = difference_first_X / time_difference;           % Speed per frame along X-Direction for 1st Droplet
    speed_first_Y = difference_first_Y / time_difference;           % Speed per frame along Y-Direction for 1st Droplet
    speed_first_Z = difference_first_Z / time_difference;           % Speed per frame along Z-Direction for 1st Droplet

    speed_second_X = difference_second_X / time_difference;         % Speed per frame along X-Direction for 2nd Droplet
    speed_second_Y = difference_second_Y / time_difference;         % Speed per frame along Y-Direction for 2nd Droplet
    speed_second_Z = difference_second_Z / time_difference;         % Speed per frame along Z-Direction for 2nd Droplet
  
    first_Radii = first_dia/2;                                          % Radius of 1st Droplet in current frame
    second_Radii = second_dia/2;                                        % Radius of 2nd Droplet in current frame         

    [x,y,z] = sphere(28);                                               % Generate a sphere consisting of 28-by-28 faces.
    
    radius_1 = first_Radii;                                             % 1st Droplet Radius
    radius_2 = second_Radii;                                            % 2nd Droplet Radius
    x_Axis_1 = first_current_X;                                         % 1st Droplet current X-position
    x_Axis_2 = second_current_X;                                        % 2nd Droplet current X-position
    y_Axis_1 = first_current_Y;                                         % 1st Droplet current Y-position
    y_Axis_2 = second_current_Y;                                        % 2nd Droplet current Y-position
    z_Axis_1 = first_current_Z;                                         % 1st Droplet current Z-position
    z_Axis_2 = second_current_Z;                                        % 2nd Droplet current Z-position
      
    % calculation for flame
    flameDia_First = flame_Dia_First(sample_point,1);                   % Diameter of flame around 1st Droplet
    flameDia_Second = flame_Dia_Second(sample_point,1);                 % Diameter of flame around 2nd Droplet
    flame_Radii_First = flameDia_First/2;                               % Radius of flame around 1st Droplet
    flame_Radii_Second = flameDia_Second/2;                             % Radius of flame around 2nd Droplet
    
    fig=surf(radius_1*x+x_Axis_1 , radius_1*y+y_Axis_1, radius_1*z+z_Axis_1, 'FaceColor', 'r', 'EdgeAlpha', '0.2');% Draw 1st Droplet
    axis equal;
    hold on;
    fig=surf(radius_2*x+x_Axis_2 , radius_2*y+y_Axis_2, radius_2*z+z_Axis_2, 'FaceColor', 'g', 'EdgeAlpha', '0.2');% Draw 2nd Droplet
    axis equal;
    hold on;
    fig=quiver3(first_current_X, first_current_Y, first_current_Z, speed_first_X, speed_first_Y, speed_first_Z, 0,'b', 'linewidth',1);% Draw velocity arrow of 1st Droplet
    hold on;
    fig=quiver3(second_current_X, second_current_Y, second_current_Z, speed_second_X, speed_second_Y, speed_second_Z, 0, 'b', 'linewidth',1);% Draw velocity arrow of 2nd Droplet
    hold on;
    fig=surf(flame_Radii_First*x+x_Axis_1 , flame_Radii_First*y+y_Axis_1, flame_Radii_First*z+z_Axis_1, 'FaceColor', 'y', 'FaceAlpha', 0.1, 'EdgeAlpha', '0.08');% Draw flame around 1st Droplet
    hold on;
    fig=surf(flame_Radii_Second*x+x_Axis_2 , flame_Radii_Second*y+y_Axis_2, flame_Radii_Second*z+z_Axis_2, 'FaceColor', 'y', 'FaceAlpha', 0.1, 'EdgeAlpha', '0.08');% Draw flame around 2nd Droplet 
    xlim([limit_X_min limit_X_max]);                                    % Set X-axis limits
    ylim([limit_Y_min limit_Y_max]);                                    % Set Y-axis limits   
    zlim([limit_Z_min limit_Z_max]);                                    % Set Z-axis limits
    hold on;
    for s=1:i                                                           % Start nested loop and run till current main loop (to draw Trajectory)
        first_x_traj = firstX(s);                                       % X-coord. of 1st Droplet                                                                                                         
        first_y_traj = firstY(s);                                       % Y-coord. of 1st Droplet
        first_z_traj = firstZ(s);                                       % Z-coord. of 1st Droplet
        scatter3(first_x_traj, first_y_traj, first_z_traj, 5, 'r', 'filled');   % Make a circle for 1st Droplet
        second_x_traj = secondX(s);                                     % X-coord. of 2nd Droplet
        second_y_traj = secondY(s);                                     % Y-coord. of 2nd Droplet
        second_z_traj = secondZ(s);                                     % Z-coord. of 2nd Droplet
        scatter3(second_x_traj, second_y_traj, second_z_traj, 5, 'g', 'filled');% Make a circle for 2nd Droplet       
    end                                                                 % Finish Loop (Trajectory plotted from first frame till current frame of main loop)
    hold off;
    ax = gca;       
    ax.GridColor = 'k';                                                 % Set Grid lines colour of 3D-plot
    ax.GridAlpha = 0.3;                                                 % Set Grid lines transparency of 3D-plot
    ax.MinorGridColor = 'k';                                            % Set colour of Minor Grid Lines in 3D-plot
    ax.XMinorGrid = 'on';                                               % Turn on Minor Grid along X-axis in 3D-plot
    ax.YMinorGrid = 'on';                                               % Turn on Minor Grid along Y-axis in 3D-plot
    ax.ZMinorGrid = 'on';                                               % Turn on Minor Grid along Z-axis in 3D-plot
    ax.FontSize = 12;                                                   % Set the Font Size in 3D-plot
    ax.FontSmoothing = 'on';                                            % Set the Font Character Smoothing in 3D-plot
    ax.XAxis.Color = 'k';                                               % Set the colour of X-Axis in 3D-plot
    ax.YAxis.Color = 'k';                                               % Set the colour of X-Axis in 3D-plot
    ax.ZAxis.Color = 'k';                                               % Set the colour of X-Axis in 3D-plot
    lgd=legend('First Drop', 'Second Drop', 'Location', 'northwest');
    lgd.Title.String = 'Legend';
    lgd.FontAngle = 'italic';
    lgd.Color = 'y';
    lgd.Units = 'centimeters';
    xlabel('X-Axis');                                                   % Label X-Axis in 3D-plot
    ylabel('Y-Axis');                                                   % Label Y-Axis in 3D-plot
    zlabel('Z-Axis');                                                   % Label Z-Axis in 3D-plot
    title('3D Plot');
    view(135,45);                                                       % Set the viewing angle of 3D-plot
%    view(0,90);
    filename = [sprintf('%03d',i) '.tif'];                              % Make a name to save file 3D frame   
    fullname = fullfile(workingDir,filename);                           % Combine frame name with working directory                                
    saveas(fig,fullname);                                               % save the frame
    disp(i);                                                            % Display the number of frame constructed 
end                                                                     % Finish main loop

% make a video from modified frames
imageNames = dir(fullfile(workingDir,'*.tif'));                         % define full path to load image
imageNames = {imageNames.name}';                                        % define the name of image to be read
outputVideo = VideoWriter(fullfile(workingDir,'Video_3D'), 'MPEG-4');   % object to make a video from frames
outputVideo.FrameRate = 30;                                             % define the frame rate of video
outputVideo.Quality = 100;
open(outputVideo)                                                       % open video object
for ii = 1:length(imageNames)                                           % run the loop for total number of frames                                     
   img = imread(fullfile(workingDir,imageNames{ii}));                   % read the frame
   J = imresize(img,[1200 2300]);                                       % Resize the frame
   writeVideo(outputVideo,J);                                           % add frame to the video
end                                                                     % finish loop
close(outputVideo);                                                     % close video object
