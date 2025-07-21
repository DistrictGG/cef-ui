use log::info;
use samp::plugin::SampPlugin;

pub struct CefUi;

impl SampPlugin for CefUi {
    fn on_load(&mut self) {
        info!("cef_ui Loaded!");
    }

    fn on_unload(self: Box<CefUi>) {
        info!("cef_ui Unloaded!");
    }
}
