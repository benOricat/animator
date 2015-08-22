/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 24/06/14
 * Time: 22:20
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat {
import com.oricat.assets.AbstractXML;
import com.oricat.assets.domVO.DomManager2;

import flash.display.MovieClip;

public class ASAXBTest extends MovieClip{

	public function ASAXBTest() {
		//var domManager:DomManager2 = new DomManager2();
		//domManager.xml = xml;
		var aXML:AbstractXML = new AbstractXML(xml);
	}

//	<DOMDocument xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://ns.adobe.com/xfl/2008/" width="512" height="384" currentTimeline="1" xflVersion="2.4" creatorInfo="Adobe Flash Professional CC" platform="Windows" versionInfo="Saved by Adobe Flash Windows 13.1 build 226" majorVersion="13" minorVersion="1" buildNumber="226" objectsSnapTo="false" viewAngle3D="51.7097123975253" nextSceneIdentifier="2" playOptionsPlayLoop="false" playOptionsPlayPages="false" playOptionsPlayFrameActions="false" filetypeGUID="DD0DDBBF-5BEF-45B2-9F24-A3048D2A676F">
	public var xml:XML = 	<DOMDocument xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://ns.adobe.com/xfl/2008/" width="512" height="384" currentTimeline="1" xflVersion="2.4" creatorInfo="Adobe Flash Professional CC" platform="Windows" versionInfo="Saved by Adobe Flash Windows 13.1 build 226" majorVersion="13" minorVersion="1" buildNumber="226" objectsSnapTo="false" viewAngle3D="51.7097123975253" nextSceneIdentifier="2" playOptionsPlayLoop="false" playOptionsPlayPages="false" playOptionsPlayFrameActions="false" filetypeGUID="DD0DDBBF-5BEF-45B2-9F24-A3048D2A676F">
		<media>
			<DOMBitmapItem name="portugal 119.JPG" itemID="5398a24f-0000001f" sourceExternalFilepath="../source/LIBRARY/portugal 119.JPG" sourceLastImported="1403943736" externalFileSize="2198496" allowSmoothing="true" quality="50" href="portugal 119.JPG" bitmapDataHRef="M 1 1402511650.dat" frameRight="72960" frameBottom="54720" isJPEG="true"/>
			<DOMBitmapItem name="portugal 129.JPG" itemID="5398a24f-00000020" sourceExternalFilepath="../source/LIBRARY/portugal 129.JPG" sourceLastImported="1340881650" externalFileSize="3906361" allowSmoothing="true" quality="50" href="portugal 129.JPG" bitmapDataHRef="M 2 1402511773.dat" frameRight="72960" frameBottom="54720" isJPEG="true"/>
			<DOMBitmapItem name="portugal 147.JPG" itemID="5398a24f-00000021" sourceExternalFilepath="../source/LIBRARY/portugal 147.JPG" sourceLastImported="1340892176" externalFileSize="5081488" allowSmoothing="true" quality="50" href="portugal 147.JPG" bitmapDataHRef="M 4 1402511807.dat" frameRight="72960" frameBottom="54720" isJPEG="true"/>
			<DOMBitmapItem name="portugal 150.JPG" itemID="5398a24f-00000022" sourceExternalFilepath="../source/LIBRARY/portugal 150.JPG" sourceLastImported="1340892420" externalFileSize="3283828" allowSmoothing="true" quality="50" href="portugal 150.JPG" bitmapDataHRef="M 3 1402511797.dat" frameRight="72960" frameBottom="54720" isJPEG="true"/>
		</media>
		<symbols>
			<Include href="Symbol 1.xml" loadImmediate="false" itemID="53ae7c0b-0000003e" lastModified="1403943947"/>
		</symbols>
		<timelines>
			<DOMTimeline name="Scene 1" currentFrame="6">
				<layers>
					<DOMLayer name="screens" color="#9933CC" autoNamed="false">
						<frames>
							<DOMFrame index="0" duration="10" name="Screen1" labelType="name" keyMode="9728">
								<elements/>
							</DOMFrame>
							<DOMFrame index="10" duration="10" name="Screen2" labelType="name" keyMode="9728">
								<elements/>
							</DOMFrame>
							<DOMFrame index="20" duration="10" name="Screen3" labelType="name" keyMode="9728">
								<elements/>
							</DOMFrame>
							<DOMFrame index="30" duration="10" name="Screen4" labelType="name" keyMode="9728">
								<elements/>
							</DOMFrame>
						</frames>
					</DOMLayer>
					<DOMLayer name="images" color="#4F80FF" current="true" isSelected="true" autoNamed="false">
						<frames>
							<DOMFrame index="0" duration="10" keyMode="9728">
								<elements>
									<DOMShape>
										<fills>
											<FillStyle index="1">
												<SolidColor color="#0066CC"/>
											</FillStyle>
										</fills>
										<edges>
											<Edge fillStyle1="1" edges="!0 2980|760 2980!760 2980|760 3620!760 3620|0 3620!0 3620|0 2980"/>
										</edges>
									</DOMShape>
									<DOMBitmapInstance libraryItemName="portugal 119.JPG">
										<matrix>
											<Matrix a="0.140350341796875" d="0.140350341796875" tx="57.95" ty="37"/>
										</matrix>
									</DOMBitmapInstance>
									<DOMSymbolInstance libraryItemName="Symbol 1" selected="true">
										<matrix>
											<Matrix tx="236.95" ty="176"/>
										</matrix>
										<transformationPoint>
											<Point x="19" y="16"/>
										</transformationPoint>
									</DOMSymbolInstance>
								</elements>
							</DOMFrame>
							<DOMFrame index="10" duration="10" keyMode="9728">
								<elements>
									<DOMBitmapInstance libraryItemName="portugal 129.JPG">
										<matrix>
											<Matrix a="0.136337280273438" b="0.0333251953125" c="-0.0333251953125" d="0.136337280273438" tx="52.9" ty="-55.3"/>
										</matrix>
									</DOMBitmapInstance>
								</elements>
							</DOMFrame>
							<DOMFrame index="20" duration="10" keyMode="9728">
								<elements>
									<DOMBitmapInstance libraryItemName="portugal 150.JPG">
										<matrix>
											<Matrix a="0.140350341796875" d="0.10528564453125"/>
										</matrix>
									</DOMBitmapInstance>
								</elements>
							</DOMFrame>
							<DOMFrame index="30" duration="10" keyMode="9728">
								<elements>
									<DOMBitmapInstance libraryItemName="portugal 147.JPG">
										<matrix>
											<Matrix a="0.0507354736328125" b="0.0859222412109375" c="-0.111190795898438" d="0.0079345703125" tx="315.6" ty="24.45"/>
										</matrix>
									</DOMBitmapInstance>
								</elements>
							</DOMFrame>
						</frames>
					</DOMLayer>
				</layers>
			</DOMTimeline>
		</timelines>
		<persistentData>
			<PD n="ane.tmp.unzipped.folder" v="C:\Users\ben\AppData\Local\Temp\Tmp_ANE_File_Unzipped_Packages"/>
			<PD n="com.air.sdk.path"/>
		</persistentData>
		<PrinterSettings/>
		<publishHistory>
			<PublishItem publishSize="14278162" publishTime="1402737881"/>
			<PublishItem publishSize="14278180" publishTime="1402737159"/>
			<PublishItem publishSize="14278179" publishTime="1402737119"/>
			<PublishItem publishSize="14278165" publishTime="1402737026"/>
			<PublishItem publishSize="14278152" publishTime="1402736806"/>
			<PublishItem publishSize="14278155" publishTime="1402736794"/>
			<PublishItem publishSize="14278094" publishTime="1402736582"/>
			<PublishItem publishSize="14275988" publishTime="1402513389"/>
			<PublishItem publishSize="14275981" publishTime="1402513316"/>
			<PublishItem publishSize="14275677" publishTime="1402512782"/>
			<PublishItem publishSize="14275654" publishTime="1402512686"/>
		</publishHistory>
	</DOMDocument>;
}
}
