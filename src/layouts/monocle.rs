use crate::models::Window;
use crate::models::Workspace;

/// Layout which gives only one window in a monocle mode.
pub fn update(workspace: &Workspace, windows: &mut Vec<&mut &mut Window>) {
    let window_count = windows.len();

    if window_count == 0 {
        return;
    }

    let iter = windows.iter_mut();

    for w in iter {
            w.set_height(workspace.height());
            w.set_width(workspace.width());
            w.set_x(workspace.x());
            w.set_y(workspace.y());
            w.set_visible(false);

            let handle = DisplayEvent::FocusedWindow(handle, x, y);
            if &w.focused_window_history[0].clone() == &w.handle  {
                w.set_visible(true);
            };

    }
}
