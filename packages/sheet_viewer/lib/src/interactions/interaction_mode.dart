enum InteractionMode {
  /// No active interaction.
  idle,

  /// Dragging one or more selected pieces.
  dragging,

  /// Resizing the active piece.
  resizing,

  /// Panning the camera.
  panning,

  /// Dragging a marquee (selection rectangle).
  marqueeSelecting,
}