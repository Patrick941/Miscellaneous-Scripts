// by tuberry
/* exported init */
'use strict';

const Main = imports.ui.main;
const St = imports.gi.St;
const Clutter = imports.gi.Clutter;
const ExtensionUtils = imports.misc.extensionUtils;
const Me = ExtensionUtils.getCurrentExtension();
const ByteArray = imports.byteArray;

class Extension {
    enable() {
        log('Enabling extension');
        this._addIndicator();
    }

    disable() {
        log('Disabling extension');
        if (this._container) {
            this._container.destroy();
            this._container = null;
        }
    }

    _addIndicator() {
        // Get the primary monitor's geometry
        const primaryMonitor = Main.layoutManager.primaryMonitor;
        const x = primaryMonitor.x + 100;
        const y = primaryMonitor.y + 100;

        this._container = new St.BoxLayout({
            style_class: 'extension-container',
            reactive: true,
            x: x,
            y: y,
            width: 64,
            height: 64,
        });

        this._icon = new St.Icon({ icon_name: 'system-run-symbolic', style_class: 'system-status-icon' });
        log(`Icon created with name: ${this._icon.icon_name}`);
        
        // Add a background color to make the icon more noticeable
        this._container.set_style('background-color: red;');
        
        // Ensure the icon is visible
        this._icon.opacity = 255;
        
        this._container.add_child(this._icon);
        Main.layoutManager.backgroundGroup.add_child(this._container);
        log('Icon added to backgroundGroup');
        
        // Force a relayout to ensure the actor is allocated space
        Main.layoutManager.backgroundGroup.queue_relayout();
    }
}

function init() {
    log('Initializing extension');
    return new Extension();
}