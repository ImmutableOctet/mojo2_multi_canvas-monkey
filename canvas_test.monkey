Strict

Public

' Preprocessor related:
#GLFW_WINDOW_TITLE = "Canvas Test Application"
#GLFW_WINDOW_WIDTH = 640
#GLFW_WINDOW_HEIGHT = 480

#GLFW_WINDOW_RESIZABLE = True
#GLFW_WINDOW_DECORATED = True
#GLFW_WINDOW_FLOATING = False
#GLFW_WINDOW_FULLSCREEN = False

' Imports:
Import mojo2

' Classes:
Class Application Extends App
	' Constant variable(s):
	Const VWIDTH:Int = 640
	Const VHEIGHT:Int = 360
	
	Const VASPECT:= (Float(VWIDTH) / Float(VHEIGHT))
	
	' Constructor(s):
	Method OnCreate:Int()
		SetUpdateRate(0) ' 60
		
		canvasA = New Canvas(Null)
		canvasB = New Canvas(Null)
		
		Return 0
	End
	
	' Methods:
	Method OnRender:Int()
		canvasA.SetAlpha(1.0)
		canvasA.SetViewport(0, 0, DeviceWidth(), DeviceHeight())
		canvasA.Clear(1.0, 0.0, 0.0)
		
		canvasA.Flush()
		
		Local virtualAspectRatio:Float = VASPECT
		Local deviceAspectRatio:Float = (Float(DeviceWidth()) / Float(DeviceHeight()))
		
		Local X:= 0
		Local Y:= 0
		
		Local vx:Int, vy:Int, vw:Int, vh:Int
		
		If (deviceAspectRatio > virtualAspectRatio) Then
			vw = Int(Float(DeviceHeight()) * virtualAspectRatio)
			vh = DeviceHeight()
			
			vx = (((DeviceWidth() - vw) / 2) + X)
			vy = Y
		Else ' Elseif (virtualAspectRatio < deviceAspectRatio) Then
			vw = DeviceWidth()
			vh = Int(DeviceWidth() / virtualAspectRatio)
			
			vx = X
			vy = (((DeviceHeight() - vh) / 2) + Y)
		Endif
		
		canvasB.SetViewport(vx, vy, vw, vh)
		
		canvasB.SetProjection2d(0, VWIDTH, 0, VHEIGHT)
		
		canvasB.Clear(0.0, 1.0, 0.0)
		
		canvasB.Flush()
		
		Return 0
	End
	
	' Fields:
	Field canvasA:Canvas
	Field canvasB:Canvas
End

' Functions:
Function Main:Int()
	New Application()
	
	Return 0
End