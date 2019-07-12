/*
  ==============================================================================

    This file was auto-generated!

    It contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#include "PluginProcessor.h"
#include "PluginEditor.h"

//==============================================================================
SimpleScopeAudioProcessorEditor::SimpleScopeAudioProcessorEditor (SimpleScopeAudioProcessor& p)
    : AudioProcessorEditor (&p), processor (p)
	, scopeComponent(p.getAudioBufferQueue())
{
	addAndMakeVisible(scopeComponent);

	setResizable(true, true);
    // Make sure that before the constructor has finished, you've set the
    // editor's size to whatever you need it to be.
    setSize (400, 300);
}

SimpleScopeAudioProcessorEditor::~SimpleScopeAudioProcessorEditor()
{
}

//==============================================================================
void SimpleScopeAudioProcessorEditor::paint (Graphics& g)
{
    // (Our component is opaque, so we must completely fill the background with a solid colour)
    g.fillAll (getLookAndFeel().findColour (ResizableWindow::backgroundColourId));
}

void SimpleScopeAudioProcessorEditor::resized()
{
    // This is generally where you'll want to lay out the positions of any
    // subcomponents in your editor..

	scopeComponent.setBounds(getLocalBounds());
}
