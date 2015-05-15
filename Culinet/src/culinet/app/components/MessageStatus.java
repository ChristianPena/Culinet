package culinet.app.components;

import org.controlsfx.glyphfont.FontAwesome;
import org.controlsfx.glyphfont.GlyphFont;
import org.controlsfx.glyphfont.GlyphFontRegistry;

import javafx.scene.Node;
import javafx.scene.control.Label;
import javafx.scene.paint.Color;

public class MessageStatus {
	
	private Label message = null;	
	
	public MessageStatus() {
		
	}
	
	public void createMessage(String text, String type){
		
		GlyphFont fontAwesome = GlyphFontRegistry.font("FontAwesome");
		
		Node iconMessage = null;
		
		setMessage();		
		getMessage().setText(text);
		
		switch(type){
		
			case "S":
				iconMessage = fontAwesome.create(FontAwesome.Glyph.CHECK_CIRCLE)
													.size(14)
													.color(Color.GREEN);
				
			case "E":
				iconMessage = fontAwesome.create(FontAwesome.Glyph.EXCLAMATION_CIRCLE)
													.size(14)
													.color(Color.RED);
				
			case "W":
				iconMessage = fontAwesome.create(FontAwesome.Glyph.EXCLAMATION_TRIANGLE)
													.size(14)
													.color(Color.YELLOW);
				
			case "T":
				iconMessage = fontAwesome.create(FontAwesome.Glyph.CLOCK_ALT)
													.size(14)
													.color(Color.BLUE);
		
		}
		
	}

	public Label getMessage() {
		return message;
	}

	public void setMessage() {
		Label message = new Label();
		this.message = message;
	}

}
