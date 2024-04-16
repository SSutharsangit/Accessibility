import 'package:accessibility_features/accessible_heading_text.dart';
import 'package:accessibility_features/accessible_text.dart';
import 'package:accessibility_features/accessiblity_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:accessibility_features/accessibility_features.dart';
import 'package:test_app/new.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AccessibilityFeatures(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accessibility Features Demo',
      theme: ThemeData(
        // Use the color blind mode to adjust the color scheme
        scaffoldBackgroundColor:
            context.watch<AccessibilityFeatures>().scaldBgColor,
        brightness: context.watch<AccessibilityFeatures>().colorBlindMode
            ? Brightness.dark
            : Brightness.light,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final accessibilitySettings = context.watch<AccessibilityFeatures>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility Features'),
      ),
      body: ListView(
        children: [
          
          ListTile(
            title: AccessibleHeadingText(
                accessibilitySettings.colorBlindMode
                    ? 'light mode'
                    : 'Dark mode',
                style: const TextStyle(fontSize: 20.0)),
            trailing: Switch(
              value: accessibilitySettings.colorBlindMode,
              onChanged: (value) {
                accessibilitySettings.toggleColorBlindMode();
                // _updateTheme(context);
              },
            ),
          ),
           ListTile(
            title: const AccessibleHeadingText("Monochrome",
                style: TextStyle(fontSize: 20.0)),
            trailing: Switch(
              value: accessibilitySettings.monochrome,
              onChanged: (value) {
                accessibilitySettings.toggleMonochrome();
                // _updateTheme(context);
              },
            ),
          ),
          ListTile(
            title: const AccessibleHeadingText("Visually Impaired Mode",
                style: TextStyle(fontSize: 20.0)),
            trailing: Switch(
              value: accessibilitySettings.impairedMode,
              onChanged: (value) {
                accessibilitySettings.toggleimpairedMode();
                // _updateTheme(context);
              },
            ),
          ),
          const AccessibilityImage(
          image: AssetImage('assets/hello.png'), // Provide your image here
          width: 200, // Optional: Set the width of the image
          height: 200, // Optional: Set the height of the image
          fit: BoxFit.cover, // Optional: Set the fit of the image
          alignment: Alignment.center, // Optional: Set the alignment of the image
           // Optional: Apply a color to the image
          colorBlendMode: BlendMode.colorBurn, // Optional: Set the color blend mode
          filterQuality: FilterQuality.high, // Optional: Set the filter quality
        ),
           
          ListTile(
            title:  AccessibleHeadingText( accessibilitySettings.imageVisibility
                    ? 'Hide Image'
                    : 'Show Image',
                style: TextStyle(fontSize: 20.0)),
           
            trailing:  Switch(
              value: !accessibilitySettings.imageVisibility,
              onChanged: (value) {
                accessibilitySettings.hideImage();
                // _updateTheme(context);
              },
            ),
          ), 
          
        
          ListTile(
            title: const AccessibleHeadingText('Font Size: ',
                style: TextStyle(fontSize: 20.0)),
            subtitle: const AccessibleText('Adjust font size',
                style: TextStyle(
                  fontSize: 14.0,
                )),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    accessibilitySettings.decreaseFontSize();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    accessibilitySettings.increaseFontSize();
                  },
                ),
              ],
            ),
          ), 
          
          ListTile(
            title: const AccessibleHeadingText('Line Height: ',
                style: TextStyle(fontSize: 20.0)),
            subtitle: const AccessibleText('Adjust line Height',
                style: TextStyle(
                  fontSize: 14.0,
                )),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    accessibilitySettings.decreaseLineHeight();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    accessibilitySettings.increaseFontSize();
                  },
                ),
              ],
            ),
          ),
              ListTile(
            title: const AccessibleHeadingText('Letter Space: ',
                style: TextStyle(fontSize: 20.0)),
            subtitle: const AccessibleText('Adjust letter Space',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.red,
                  
                ),
              
                ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    accessibilitySettings.decreaseLetterSpace();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    accessibilitySettings.increaseLetterSpace();
                  },
                ),
              ],
            ),
          ),
        

          // color change
          ListTile(
            title: const AccessibleHeadingText('Heading Color: ',
                style: TextStyle(fontSize: 20.0)),
            subtitle: const AccessibleText('Change heading color',
                style: TextStyle(
                  fontSize: 14.0,
                )),
            trailing: SizedBox(
              width: 150.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.color_lens,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      accessibilitySettings.setHeadingColor(Colors.red);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.color_lens,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      accessibilitySettings.setHeadingColor(Colors.green);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.color_lens,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      accessibilitySettings.setHeadingColor(Colors.blue);
                    },
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const AccessibleHeadingText('Text Color: ',
                style: TextStyle(fontSize: 20.0)),
            subtitle: const AccessibleText('Change Text color',
                style: TextStyle(
                  fontSize: 14.0,
                )),
            trailing: SizedBox(
              width: 150.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.color_lens, color: Colors.red),
                    onPressed: () {
                      accessibilitySettings.setTextColor(Colors.red);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.color_lens, color: Colors.green),
                    onPressed: () {
                      accessibilitySettings.setTextColor(Colors.green);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.color_lens, color: Colors.blue),
                    onPressed: () {
                      accessibilitySettings.setTextColor(Colors.blue);
                    },
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const AccessibleHeadingText('Text BackgroundColor: ',
                style: TextStyle(fontSize: 18.0)),
            subtitle: const AccessibleText('Change Text BackgroundColor',
                style: TextStyle(
                  fontSize: 14.0,
                )),
            trailing: SizedBox(
              width: 150.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.color_lens, color: Colors.red),
                    onPressed: () {
                      accessibilitySettings.setTextBgColor(Colors.red);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.color_lens, color: Colors.green),
                    onPressed: () {
                      accessibilitySettings.setTextBgColor(Colors.green);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.color_lens, color: Colors.blue),
                    onPressed: () {
                      accessibilitySettings.setTextBgColor(Colors.blue);
                    },
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const AccessibleHeadingText(' Scalfold BackgroundColor: ',
                style: TextStyle(fontSize: 15.0)),
            subtitle: const AccessibleText('Change  BackgroundColor',
                style: TextStyle(
                  fontSize: 14.0,
                )),
            trailing: SizedBox(
              width: 150.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.color_lens, color: Colors.red),
                    onPressed: () {
                      accessibilitySettings.setScalfoldColor(Colors.red);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.color_lens, color: Colors.green),
                    onPressed: () {
                      accessibilitySettings.setScalfoldColor(Colors.green);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.color_lens, color: Colors.blue),
                    onPressed: () {
                      accessibilitySettings.setScalfoldColor(Colors.blue);
                    },
                  ),
                ],
              ),
            ),
          ),
   GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyWidget(),
      ),
    );
  },
  child: Text("NEXT PAGE")
),

          ElevatedButton(
              onPressed: () {
                accessibilitySettings.reset();
              },
              child: const AccessibleText("Reset"))
        ],
      ),
    );
  }
}
