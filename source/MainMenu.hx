package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.ui.FlxButton;
import js.html.audio.ChannelSplitterNode;

class MainMenu extends FlxState
{
	var menu:Array<String> = ['play', 'iconkit', 'editor', 'github', 'chestdaily'];
	var menuButtons:FlxTypedGroup<FlxButton>;

	override function create()
	{
		menuButtons = new FlxTypedGroup<FlxButton>();

		for (i in 0...menu.length)
		{
			var button:FlxButton = new FlxButton(0, 0, "", function()
			{
				var menuBtn = menu[i];
				if (menuBtn == 'play')
				{
					FlxG.switchState(new LevelSelect());
				}
				else if (menuBtn == 'iconkit')
				{
					FlxG.switchState(new IconKit());
				}
				else if (menuBtn == 'editor')
				{
					FlxG.switchState(new EditorMenu());
				}
				else if (menuBtn == 'github')
				{
					FlxG.openURL("https://github.com/Trecus/FlxDash");
				}
				else if (menuBtn == 'chestdaily')
				{
					trace("daily");
					openSubState(new ChestOpen());
				}
			});
			button.screenCenter(Y);
			if (menu[i] == 'play')
				button.screenCenter(XY);
			button.loadGraphic('assets/images/mainmenu/${menu[i]}.png');
			if (menu[i] == 'iconkit')
			{
				button.screenCenter(X);
				button.x -= 250;
				// button.loadGraphic('assets/images/mainmenu/iconkit.png');
			}
			else if (menu[i] == 'editor')
			{
				button.screenCenter(X);
				button.x += 250;
				// button.loadGraphic('assets/images/mainmenu/editor.png');
			}
			else if (menu[i] == 'github')
			{
				button.x = 1280 - 236;
				button.y = 720 - 224;
			}
			else if (menu[i] == 'chestdaily')
			{
				button.scale.set(.65, .65);
				button.x = 1044;
			}
			trace(button.x);
			button.ID = i;
			menuButtons.add(button);
		}
		super.create();

		var logo:FlxSprite;
		logo = new FlxSprite();
		logo.loadGraphic("assets/images/logo.png");
		logo.scale.set(0.65, .65);
		logo.screenCenter(X);
		logo.y = 25;

		add(menuButtons);
		add(logo);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		menuButtons.forEach(function(button:FlxButton)
		{
			if (menu[button.ID] == 'play')
			{
				button.screenCenter();
			}
			else if (menu[button.ID] != 'github' && menu[button.ID] != 'play')
			{
				button.screenCenter(Y);
			}
		});
	}
}
