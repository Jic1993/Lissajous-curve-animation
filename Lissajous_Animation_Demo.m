%% Animation demo for Lissajous curve 
close all;clear;clc;

%%
% Create a new figure window,
% Background color is white
% MenuBar is hidden
% Image size is 480*480
figure('Color','w','MenuBar','none','InnerPosition',[0 0 480 480]);
co = [65/255, 131/255, 196/255]; % specify the color
% Create animated line object
headMarker = animatedline('LineStyle','none','Marker','o','Color',co,'MarkerFaceColor',co);
body = animatedline('LineStyle','-','LineWidth',1.3,'Color',co); % trajectory
axis([-1,1,-1,1]); axis off; % hide axis

%% 
% Parameters
a = 13;
b = 18;
phi = pi * 0;

% Parametric Equation of Lissajous Curve
t = linspace(0,2*pi,1000); % generate 1000 linearly equally spaced points
x = sin(a*t);
y = sin(b*t+ phi);

%%
% Display
for idx = 1:length(t)
    addpoints(headMarker,x(idx),y(idx));
    addpoints(body,x(idx),y(idx));
    drawnow 
    % Capture the current plot
    frame = getframe; % snapshot of the current axes
    im{idx} = frame2im(frame); % write image data to `im`
    % Remove previous head marker except for the last one
    if idx~=length(t)
        clearpoints(headMarker);
    end
end


% figure;
% for idx = 1:9
%     subplot(3,3,idx)
%     imshow(im{idx});
% end

%%
% Save images into a GIF file. 
% Because three-dimensional data is not supported for GIF files, 
% call rgb2ind to convert the RGB data in the image to an indexed image A with a colormap map. 
filename = 'Lissajous.gif'; % specify the output file name
for idx = 1:length(t)
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        %Set DelayTime = 0 to display next images as fast as your hardware allows
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0);
    else
        % To append multiple images to the first image
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0);
    end
end
