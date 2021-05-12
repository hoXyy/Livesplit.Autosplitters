// Only works for Japanese version of the game

state("gta-vc")
{
    float percent: 0x41E420;
}

startup {
    vars.createTextComponent = (Func<string, string, LiveSplit.UI.Components.IComponent>)((name, value) => {
        var textComponentAssembly = Assembly.LoadFrom("Components\\LiveSplit.Text.dll");
        dynamic textComponent = Activator.CreateInstance(textComponentAssembly.GetType("LiveSplit.UI.Components.TextComponent"), timer);
        timer.Layout.LayoutComponents.Add(new LiveSplit.UI.Components.LayoutComponent("LiveSplit.Text.dll", textComponent as LiveSplit.UI.Components.IComponent));
        textComponent.Settings.Text1 = name;
        textComponent.Settings.Text2 = value;
        return textComponent;
    });

    vars.removeTextComponent = (Action) (() => {
        int indexToRemove = -1;
        foreach (dynamic component in timer.Layout.Components) {
            if (component.GetType().Name == "TextComponent" && System.Text.RegularExpressions.Regex.IsMatch(component.Settings.Text1, "Percentage Completed")) {
                indexToRemove = timer.Layout.Components.ToList().IndexOf(component);
                break;
            }
        }

        timer.Layout.LayoutComponents.RemoveAt(indexToRemove);
    });
}

init {
    vars.textComponent = vars.createTextComponent("Percentage Completed", "0.00%");
}

update {
    vars.textComponent.Settings.Text2 = String.Format("{0:0.##}", current.percent) + "%";
}

exit {
    vars.removeTextComponent();
}