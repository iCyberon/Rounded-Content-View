Rounded-Content-View
====================

Rounded content view for Mac OS X

It's also possible to alter the titlebar gradient color. Actually that's possible becuase we're using textured window here and as a bunes we get this weird but cool effect. In order to make it a whitish and flat you need to change the `ContentBorderThickness`, the best way to do this is to set `setAutorecalculatesContentBorderThickness` property to `YES`.

```objectivec
[[self window] setAutorecalculatesContentBorderThickness:YES forEdge:NSMaxYEdge];
```

![Rounded Content View](http://cl.ly/image/1x2p1I1W2D14/contents "Example")

## License

Rounded Content View is available under the MIT License. See the LICENSE file for more info.
