<?xml version="1.0" encoding="UTF-8"?>
<structure version="8" xsltversion="1" cssmode="quirks" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="UTF-8" encodingpdf="UTF-8" useimportschema="1" embed-images="1">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="site.xsd" workingxmlfile="blocks.xml" templatexmlfile="blocks.xml">
				<xmltablesupport standard="HTML">
					<usertags/>
				</xmltablesupport>
				<textstateicons>
					<textstateicon match="header" iconfile="header.bmp"/>
					<textstateicon match="para" iconfile="para.bmp"/>
				</textstateicons>
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
	<mainparts>
		<children>
			<globaltemplate subtype="main" match="/">
				<children>
					<template subtype="source" match="XML">
						<children>
							<tgrid>
								<children>
									<tgridbody-cols>
										<children>
											<tgridcol>
												<properties width="643"/>
											</tgridcol>
										</children>
									</tgridbody-cols>
									<tgridbody-rows>
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<styles border-bottom-color="black" border-bottom-style="solid" border-bottom-width="thin"/>
														<children>
															<text fixtext="These are the &quot;blocks&quot; of the website.  They contain the chucks of content that are to populate the sections of the website.  Each xml file representing a webpage have the option of inserting these preformated parts, for the ability to change data on a site without editing each page individually."/>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
									</tgridbody-rows>
								</children>
							</tgrid>
							<template subtype="element" match="blocks">
								<children>
									<tgrid>
										<properties border="1"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol>
														<properties width="200"/>
													</tgridcol>
													<tgridcol>
														<properties width="354"/>
													</tgridcol>
												</children>
											</tgridbody-cols>
											<tgridheader-rows>
												<children>
													<tgridrow>
														<children>
															<tgridcell>
																<properties align="center" width="200"/>
																<children>
																	<text fixtext="ID">
																		<styles font-weight="bold"/>
																	</text>
																</children>
															</tgridcell>
															<tgridcell>
																<properties align="center" width="354"/>
																<children>
																	<text fixtext="Page Fragment">
																		<styles font-weight="bold"/>
																	</text>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridheader-rows>
											<tgridbody-rows>
												<children>
													<template subtype="element" match="block_instance">
														<children>
															<tgridrow>
																<children>
																	<tgridcell>
																		<children>
																			<template subtype="element" match="id">
																				<children>
																					<content>
																						<format datatype="ID"/>
																					</content>
																				</children>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<children>
																			<template subtype="element" match="pagefragment">
																				<children>
																					<content/>
																				</children>
																			</template>
																		</children>
																	</tgridcell>
																</children>
															</tgridrow>
														</children>
													</template>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
								</children>
							</template>
							<newline/>
							<newline/>
							<newline/>
						</children>
					</template>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts>
		<children>
			<globaltemplate subtype="element" match="br">
				<children>
					<template subtype="element" match="br">
						<children>
							<newline/>
						</children>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="element" match="header">
				<children>
					<template subtype="element" match="header">
						<children>
							<content>
								<styles font-size="large" font-style="italic" font-weight="bold"/>
								<format datatype="anyType"/>
							</content>
						</children>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="element" match="id">
				<children>
					<template subtype="element" match="id">
						<children>
							<content>
								<styles font-style="italic"/>
								<format datatype="ID"/>
							</content>
						</children>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="element" match="img">
				<children>
					<template subtype="element" match="img">
						<children>
							<image>
								<properties border="0"/>
								<target>
									<xpath value="@src"/>
								</target>
								<imagesource>
									<xpath value="@src"/>
								</imagesource>
							</image>
						</children>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="element" match="list">
				<children>
					<template subtype="element" match="list">
						<children>
							<list>
								<styles margin-bottom="0" margin-top="0"/>
								<children>
									<template subtype="element" match="listitem">
										<children>
											<listrow>
												<children>
													<content/>
												</children>
											</listrow>
										</children>
									</template>
								</children>
							</list>
						</children>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="element" match="para">
				<children>
					<template subtype="element" match="para">
						<children>
							<paragraph paragraphtag="p">
								<children>
									<content/>
								</children>
							</paragraph>
						</children>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="element" match="url">
				<children>
					<template subtype="element" match="url">
						<children>
							<link>
								<children>
									<content>
										<format datatype="string"/>
									</content>
								</children>
								<action>
									<none/>
								</action>
								<bookmark/>
								<hyperlink>
									<xpath value="."/>
								</hyperlink>
							</link>
						</children>
					</template>
				</children>
			</globaltemplate>
		</children>
	</globalparts>
	<pagelayout/>
	<designfragments/>
</structure>
