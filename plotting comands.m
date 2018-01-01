% Defaults for this blog post
width = 4.5;     % Width in inches
height = 4.5;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz = 11;      % Fontsize
lw = 1.5;      % LineWidth
msz = 8;       % MarkerSize

close all;

% The properties we've been using in the figures
set(0,'defaultLineLineWidth',lw);   % set the default line width to lw
set(0,'defaultLineMarkerSize',msz); % set the default line marker size to msz
set(0,'defaultLineLineWidth',lw);   % set the default line width to lw
set(0,'defaultLineMarkerSize',msz); % set the default line marker size to msz

% Set the default Size for display
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);

% Set the defaults for saving/printing to a file
set(0,'defaultFigureInvertHardcopy','on'); % This is the default anyway
set(0,'defaultFigurePaperUnits','inches'); % This is the default anyway
defsize = get(gcf, 'PaperSize');
left = (defsize(1)- width)/2;
bottom = (defsize(2)- height)/2;
defsize = [left, bottom, width, height];
set(0, 'defaultFigurePaperPosition', defsize);

% figure(1), clf, 
% semilogy(iterations_set',  (save_thing_opt_1(:,2)),iterations_set',  (save_thing_opt_2(:,2)),iterations_set',  (save_thing_opt_4(:,1)), iterations_set',  (save_thing_opt_5(:,1)))
% %legend('L_{1}','L_{2}','L_{3}','L_{4}')
% xlabel('Iterations')
% ylabel('Error')

%% USE THIS BIT FOR ACTUALLY PLOTTING< BUT OBVIOUSLY CHANGE OUTPUT TITLE

fig = gcf;
fig.PaperPositionMode = 'auto'
fig_pos = fig.PaperPosition;
fig.PaperSize = [fig_pos(3) fig_pos(4)];
print(fig,'-dpsc','-loose','IterationVGrid-5_SHAM.eps')