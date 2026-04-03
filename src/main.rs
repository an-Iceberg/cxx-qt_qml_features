#![allow(clippy::needless_return)]

pub mod containers;
pub mod invokables;
pub mod naming;
pub mod properties;
pub mod signals;
pub mod singleton;
pub mod threading;

use cxx_qt_lib::{QGuiApplication, QQmlApplicationEngine, QUrl};

fn main()
{
  let mut app = QGuiApplication::new();
  let mut engine = QQmlApplicationEngine::new();

  if let Some(engine) = engine.as_mut()
  { engine.load(&QUrl::from("qrc:/qt/qml/qml_features/qml/Main.qml")); }

  if let Some(app) = app.as_mut() { app.exec(); }
}
