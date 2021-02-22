use crate::models::Window;
use crate::models::Workspace;
use crate::models::Manager;

/// Layout which gives only one window in a monocle mode.
pub fn update(workspace: &Workspace, windows: &mut Vec<&mut &mut Window>) {
    let window_count = windows.len();

    if window_count == 0 {
        return;
    }

    let mut iter = windows.iter_mut();

    for w in iter {
            w.set_height(workspace.height());
            w.set_width(workspace.width());
            w.set_x(workspace.x());
            w.set_y(workspace.y());

            let manager: Manager;
            match manager.focused_window() {
            w => w.set_visible(true),
            //why is w losing scope here?
            _ => w.set_visible(false),
            };
    }
    return;
}
