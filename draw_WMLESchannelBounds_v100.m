function []=draw_WMLESchannelBounds_v100(c,Lx)

plot([0 Lx],[-1 -1],c,'linewidth',3)
hold on
plot([0 Lx],[1 1],c,'linewidth',3)