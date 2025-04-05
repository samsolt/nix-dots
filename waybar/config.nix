{
    mainBar = {
        layer = "top";
        height = 30;
        spacing = 30;

        modules-left = [
            "hyprland/window"
        ];
        modules-center = [
            "hyprland/workspaces"
        ];
        modules-right = [
            "tray"
            "network"
            "clock"
        ];

        "hyprland/window" = {
            "icon" = true;
            "format" = "{class}";
        };
        "tray" = {
            "icon-size" = 21;
            "spacing" = 10;
            "show-passive-items" = true;
        };
        "network" = {
            "interface" = "wlo1";
            "format" = "{ifname}";
            "format-wifi" = "{essid} ({signalStrength}%) ";
            "format-ethernet" = "{ipaddr}/{cidr} 󰊗";
            "format-disconnected" = ""; #An empty format will hide the module.
            "tooltip-format" = "{ifname} via {gwaddr} 󰊗";
            "tooltip-format-wifi" = "{essid} ({signalStrength}%) ";
            "tooltip-format-ethernet" = "{ifname} ";
            "tooltip-format-disconnected" = "Disconnected";
            "max-length" = 50;
        };
        "clock" = {
            "format" = "{:%H:%M:%S}";
            "interval" = 1;
            "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            "format-alt" = "{:%Y-%m-%d}";
        };
    };
}
