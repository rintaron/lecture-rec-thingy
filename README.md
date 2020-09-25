# lecture-rec-thingy
Applescript spaghetti to be used to screen-record the z00m. It is designed to be used with shellscript and some sort of scheduler. 

## Motivation
- Uni's official lecture recording system continues to make me wait for 3 days until I can watch the recorded lectures. Self-help is the best help. 

## Tested Environment
- macOS Catalina 10.15.6 + BlackHole (virtual audio driver)

## Setup
Press CMD+SHIFT+5 and make sure it is configured to: 
- Use the BlackHole as a microphone
- Select the portion of the screen that corresponds with your z00m's default meeting window size (including the chat)
- Use the "Remember Last Selection" option as needed. 

## Usage
Run the Applescript. 
- It starts the screen recording. 
- The script waits until the z00m process is up & meeting window pops up. 
- Once the meeting begins (i.e. the host came in), it will first automatically open the chat tab. 
- Screen recording will be terminated when the meeting window disappears (i.e. the host ends the meeting). 