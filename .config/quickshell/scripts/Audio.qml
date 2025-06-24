import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
pragma Singleton

Singleton {
    id: root

    property bool ready: Pipewire.defaultAudioSink?.ready ?? false
    property var output: Pipewire.defaultAudioSink
    property var input: Pipewire.defaultAudioSource

    PwObjectTracker {
        objects: [output, input]
    }

}