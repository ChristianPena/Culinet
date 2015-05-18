package culinet.app.components;

import org.controlsfx.glyphfont.FontAwesome;
import org.controlsfx.glyphfont.GlyphFont;
import org.controlsfx.glyphfont.GlyphFontRegistry;

import javafx.scene.Node;
import javafx.scene.control.Label;
import javafx.scene.paint.Color;

public class MessageStatus {
	
	private Label message = null;
	private Node iconMessage = null;
	
	public MessageStatus() {
		
	}
	
	public void createMessage(String text, String type){
		
		GlyphFont fontAwesome = GlyphFontRegistry.font("FontAwesome");
		Double size = 14.0;
		
		setMessage();		
		getMessage().setText(text);
		
		switch(type){
		
			case "S":
				setIconMessage(fontAwesome.create(FontAwesome.Glyph.CHECK_CIRCLE)
													.size(size)
													.color(Color.GREEN));
				
			case "E":
				setIconMessage(fontAwesome.create(FontAwesome.Glyph.EXCLAMATION_CIRCLE)
													.size(size)
													.color(Color.RED));
				
			case "W":
				setIconMessage(fontAwesome.create(FontAwesome.Glyph.EXCLAMATION_TRIANGLE)
													.size(size)
													.color(Color.YELLOW));
				
			case "T":
				setIconMessage(fontAwesome.create(FontAwesome.Glyph.CLOCK_ALT)
													.size(size)
													.color(Color.BLUE));		
		}
		
	}

	public Label getMessage() {
		return message;
	}

	public void setMessage() {
		Label message = new Label();
		this.message = message;
	}

	public Node getIconMessage() {
		return iconMessage;
	}

	public void setIconMessage(Node iconMessage) {		
		this.iconMessage = iconMessage;
	}

}
