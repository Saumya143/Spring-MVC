<?xml version="1.0" encoding="UTF-8"?>
<structure version="8" cssmode="strict" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1">
	<parameters/>
	<schemasources>
		<namespaces>
			<nspair prefix="ts" uri="http://www.xmlspy.com/schemas/textstate"/>
		</namespaces>
		<schemasources>
			<xsdschemasource name="TextState" main="1" schemafile="TextState.xsd">
				<xmltablesupport/>
				<textstateicons/>
			</xsdschemasource>
		</schemasources>
	</schemasources>
	<modules/>
	<flags>
		<scripts/>
		<globalparts/>
		<designfragments/>
		<pagelayouts/>
	</flags>
	<scripts>
		<script language="javascript"/>
	</scripts>
	<globalstyles/>
	<mainparts/>
	<globalparts>
		<children>
			<globaltemplate subtype="element" match="ts:bold">
				<children>
					<template subtype="element" match="ts:bold">
						<children>
							<content>
								<styles font-weight="bold"/>
							</content>
						</children>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="element" match="ts:italic">
				<children>
					<template subtype="element" match="ts:italic">
						<children>
							<content>
								<styles font-style="italic"/>
							</content>
						</children>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="element" match="ts:underline">
				<children>
					<template subtype="element" match="ts:underline">
						<children>
							<content>
								<styles text-decoration="underline"/>
							</content>
						</children>
					</template>
				</children>
			</globaltemplate>
		</children>
	</globalparts>
	<pagelayout>
		<properties paperheight="11.69in" paperwidth="8.27in" size="A4"/>
	</pagelayout>
	<designfragments/>
</structure>
