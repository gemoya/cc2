import matplotlib.pyplot as plt
from matplotlib import animation

def animate_pattern(sol, time_step=10, frame_step=20):
    t_ind = 0
    fig = plt.figure()
    im = plt.imshow(sol[t_ind], cmap=plt.cm.winter)
    plt.xticks([]); plt.yticks([])

    #setting the number of frames
    frames = int(sol.shape[0]/frame_step)
    
    #update function
    def updatefig(t_ind):
        im = plt.imshow(sol[t_ind*frame_step], cmap=plt.cm.winter)
        return im,
    
    #animate it!
    ani = animation.FuncAnimation(fig, updatefig, frames=frames, 
                    interval=time_step, blit=True, repeat=True)
    plt.show()
