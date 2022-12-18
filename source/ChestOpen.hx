package;

import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import haxe.io.Path;

class ChestOpen extends FlxSubState
{
	var transBg:FlxSprite;
	var rewardsBox:FlxSprite;
	var rewardsLbl:FlxSprite;

	var closeBtn:FlxButton;

	override function create()
	{
		transBg = new FlxSprite(0, 0);
		transBg.makeGraphic(1280, 720, FlxColor.BLACK);
		transBg.screenCenter();
		transBg.alpha = .5;

		rewardsBox = new FlxSprite(0, 0);
		rewardsBox.loadGraphic(Paths.getMenuAsset('rewards'));
		rewardsBox.scale.set(.75, .75);
		rewardsBox.screenCenter();

		rewardsLbl = new FlxSprite(0, 0);
		rewardsLbl.loadGraphic(Paths.getMenuAsset('rewardsLbl'));
		rewardsLbl.scale.set(.55, .55);
		rewardsLbl.screenCenter(X);
		rewardsLbl.y += 125;

		closeBtn = new FlxButton(0, 0, "", function()
		{
			close();
		});
		closeBtn.loadGraphic(Paths.getMenuAsset('closeMenu'));
		closeBtn.scale.set(.5, .5);
		closeBtn.y = 50;
		closeBtn.x = 150;

		super.create();
		add(transBg);
		add(rewardsBox);
		add(rewardsLbl);
		add(closeBtn);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
