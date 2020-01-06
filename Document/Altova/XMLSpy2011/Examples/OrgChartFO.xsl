<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:ipo="http://www.altova.com/IPO" xmlns:n1="http://www.xmlspy.com/schemas/orgchart" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output version="1.0" method="xml" encoding="UTF-8" indent="no"/>
	<xsl:param name="SV_OutputFormat" select="'PDF'"/>
	<xsl:variable name="XML" select="/"/>
	<xsl:variable name="fo:layout-master-set">
		<fo:layout-master-set>
			<fo:simple-page-master master-name="default-page" page-height="11in" page-width="8.5in" margin-left="0.6in" margin-right="0.6in">
				<fo:region-body margin-top="0.79in" margin-bottom="0.79in"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
	</xsl:variable>
	<xsl:template match="/">
		<fo:root>
			<xsl:copy-of select="$fo:layout-master-set"/>
			<fo:page-sequence master-reference="default-page" initial-page-number="1" format="1">
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<xsl:for-each select="$XML">
							<xsl:for-each select="n1:OrgChart">
								<xsl:for-each select="n1:CompanyLogo">
									<fo:inline-container>
										<fo:block>
											<xsl:text>&#x2029;</xsl:text>
										</fo:block>
									</fo:inline-container>
									<fo:block border-bottom-color="#0588BA" border-bottom-style="solid" border-bottom-width="medium" border-width="4pt" padding-bottom="10px" padding-left="10px" margin="0pt">
										<fo:block>
											<xsl:for-each select="@href">
												<fo:basic-link text-decoration="underline" color="blue">
													<xsl:choose>
														<xsl:when test="substring(string(&apos;http://www.nanonull.com/&apos;), 1, 1) = '#'">
															<xsl:attribute name="internal-destination">
																<xsl:value-of select="substring(string(&apos;http://www.nanonull.com/&apos;), 2)"/>
															</xsl:attribute>
														</xsl:when>
														<xsl:otherwise>
															<xsl:attribute name="external-destination">
																<xsl:text>url(</xsl:text>
																<xsl:call-template name="double-backslash">
																	<xsl:with-param name="text">
																		<xsl:value-of select="string(&apos;http://www.nanonull.com/&apos;)"/>
																	</xsl:with-param>
																	<xsl:with-param name="text-length">
																		<xsl:value-of select="string-length(string(&apos;http://www.nanonull.com/&apos;))"/>
																	</xsl:with-param>
																</xsl:call-template>
																<xsl:text>)</xsl:text>
															</xsl:attribute>
														</xsl:otherwise>
													</xsl:choose>
													<fo:external-graphic>
														<xsl:attribute name="src">
															<xsl:text>url(</xsl:text>
															<xsl:call-template name="double-backslash">
																<xsl:with-param name="text">
																	<xsl:value-of select="string(.)"/>
																</xsl:with-param>
																<xsl:with-param name="text-length">
																	<xsl:value-of select="string-length(string(.))"/>
																</xsl:with-param>
															</xsl:call-template>
															<xsl:text>)</xsl:text>
														</xsl:attribute>
													</fo:external-graphic>
												</fo:basic-link>
											</xsl:for-each>
										</fo:block>
									</fo:block>
								</xsl:for-each>
								<fo:block>
									<fo:leader leader-pattern="space"/>
								</fo:block>
								<xsl:for-each select="n1:Name">
									<xsl:variable name="value-of-template">
										<xsl:apply-templates/>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="contains(string($value-of-template),'&#x2029;')">
											<fo:block color="#0588BA" font-family="Arial" font-size="20pt" font-weight="bold">
												<xsl:copy-of select="$value-of-template"/>
											</fo:block>
										</xsl:when>
										<xsl:otherwise>
											<fo:inline color="#0588BA" font-family="Arial" font-size="20pt" font-weight="bold">
												<xsl:copy-of select="$value-of-template"/>
											</fo:inline>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								<fo:block>
									<fo:leader leader-pattern="space"/>
								</fo:block>
								<xsl:for-each select="n1:Office">
									<fo:block>
										<fo:leader leader-pattern="space"/>
									</fo:block>
									<fo:inline-container>
										<fo:block>
											<xsl:text>&#x2029;</xsl:text>
										</fo:block>
									</fo:inline-container>
									<fo:block border-top-color="#0588ba" border-top-style="solid" border-top-width="2pt" margin="0pt">
										<fo:block>
											<fo:block>
												<fo:leader leader-pattern="space"/>
											</fo:block>
											<xsl:for-each select="n1:Name">
												<xsl:variable name="value-of-template">
													<xsl:apply-templates/>
												</xsl:variable>
												<xsl:choose>
													<xsl:when test="contains(string($value-of-template),'&#x2029;')">
														<fo:block color="#707070" font-family="Arial" font-size="15pt" font-weight="bold">
															<xsl:copy-of select="$value-of-template"/>
														</fo:block>
													</xsl:when>
													<xsl:otherwise>
														<fo:inline color="#707070" font-family="Arial" font-size="15pt" font-weight="bold">
															<xsl:copy-of select="$value-of-template"/>
														</fo:inline>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
											<fo:block>
												<fo:leader leader-pattern="space"/>
											</fo:block>
											<fo:inline color="#808080" font-family="Arial" font-size="smaller" font-weight="bold">
												<xsl:text>Location: </xsl:text>
											</fo:inline>
											<xsl:choose>
												<xsl:when test="not(n1:Address or  n1:Address_EU)">
													<xsl:for-each select="n1:Location">
														<fo:inline border="solid 1pt black" padding="2pt">
															<xsl:choose>
																<xsl:when test="string(.)='US'">
																	<fo:inline>
																		<xsl:text>US</xsl:text>
																	</fo:inline>
																</xsl:when>
																<xsl:when test="string(.)='EU'">
																	<fo:inline>
																		<xsl:text>EU</xsl:text>
																	</fo:inline>
																</xsl:when>
																<xsl:otherwise>
																	<fo:inline>
																		<xsl:text>US</xsl:text>
																	</fo:inline>
																</xsl:otherwise>
															</xsl:choose>
														</fo:inline>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<xsl:for-each select="n1:Location">
														<xsl:variable name="value-of-template">
															<xsl:apply-templates/>
														</xsl:variable>
														<xsl:choose>
															<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																<fo:block color="#808080" font-weight="bold">
																	<xsl:copy-of select="$value-of-template"/>
																</fo:block>
															</xsl:when>
															<xsl:otherwise>
																<fo:inline color="#808080" font-weight="bold">
																	<xsl:copy-of select="$value-of-template"/>
																</fo:inline>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>
												</xsl:otherwise>
											</xsl:choose>
										</fo:block>
									</fo:block>
									<fo:inline-container>
										<fo:block>
											<xsl:text>&#x2029;</xsl:text>
										</fo:block>
									</fo:inline-container>
									<fo:table table-layout="fixed" border="solid 1pt gray" width="100%" border-spacing="-1pt">
										<fo:table-column column-width="60%"/>
										<fo:table-column column-width="40%"/>
										<fo:table-body start-indent="0pt">
											<fo:table-row>
												<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="before">
													<fo:block>
														<xsl:choose>
															<xsl:when test="n1:Location =&quot;US&quot;">
																<xsl:for-each select="n1:Address">
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border-spacing="4px">
																		<fo:table-column column-width="30%"/>
																		<fo:table-column column-width="70%"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline font-weight="bold">
																							<xsl:text>Street: </xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<xsl:for-each select="ipo:street">
																							<xsl:variable name="value-of-template">
																								<xsl:apply-templates/>
																							</xsl:variable>
																							<xsl:choose>
																								<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																									<fo:block>
																										<xsl:copy-of select="$value-of-template"/>
																									</fo:block>
																								</xsl:when>
																								<xsl:otherwise>
																									<fo:inline>
																										<xsl:copy-of select="$value-of-template"/>
																									</fo:inline>
																								</xsl:otherwise>
																							</xsl:choose>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline font-weight="bold">
																							<xsl:text>City:</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<xsl:for-each select="ipo:city">
																							<xsl:variable name="value-of-template">
																								<xsl:apply-templates/>
																							</xsl:variable>
																							<xsl:choose>
																								<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																									<fo:block>
																										<xsl:copy-of select="$value-of-template"/>
																									</fo:block>
																								</xsl:when>
																								<xsl:otherwise>
																									<fo:inline>
																										<xsl:copy-of select="$value-of-template"/>
																									</fo:inline>
																								</xsl:otherwise>
																							</xsl:choose>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline font-weight="bold">
																							<xsl:text>State &amp; Zip:</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<xsl:for-each select="ipo:state">
																							<fo:inline border="solid 1pt black" padding="2pt">
																								<xsl:choose>
																									<xsl:when test="string(.)='AK'">
																										<fo:inline>
																											<xsl:text>AK</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='AL'">
																										<fo:inline>
																											<xsl:text>AL</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='AR'">
																										<fo:inline>
																											<xsl:text>AR</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='AZ'">
																										<fo:inline>
																											<xsl:text>AZ</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='CA'">
																										<fo:inline>
																											<xsl:text>CA</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='CO'">
																										<fo:inline>
																											<xsl:text>CO</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='CT'">
																										<fo:inline>
																											<xsl:text>CT</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='DC'">
																										<fo:inline>
																											<xsl:text>DC</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='DE'">
																										<fo:inline>
																											<xsl:text>DE</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='FL'">
																										<fo:inline>
																											<xsl:text>FL</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='GA'">
																										<fo:inline>
																											<xsl:text>GA</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='GU'">
																										<fo:inline>
																											<xsl:text>GU</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='HI'">
																										<fo:inline>
																											<xsl:text>HI</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='IA'">
																										<fo:inline>
																											<xsl:text>IA</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='ID'">
																										<fo:inline>
																											<xsl:text>ID</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='IL'">
																										<fo:inline>
																											<xsl:text>IL</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='IN'">
																										<fo:inline>
																											<xsl:text>IN</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='KS'">
																										<fo:inline>
																											<xsl:text>KS</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='KY'">
																										<fo:inline>
																											<xsl:text>KY</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='LA'">
																										<fo:inline>
																											<xsl:text>LA</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='MA'">
																										<fo:inline>
																											<xsl:text>MA</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='MD'">
																										<fo:inline>
																											<xsl:text>MD</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='ME'">
																										<fo:inline>
																											<xsl:text>ME</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='MI'">
																										<fo:inline>
																											<xsl:text>MI</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='MN'">
																										<fo:inline>
																											<xsl:text>MN</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='MO'">
																										<fo:inline>
																											<xsl:text>MO</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='MS'">
																										<fo:inline>
																											<xsl:text>MS</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='MT'">
																										<fo:inline>
																											<xsl:text>MT</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='NC'">
																										<fo:inline>
																											<xsl:text>NC</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='ND'">
																										<fo:inline>
																											<xsl:text>ND</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='NE'">
																										<fo:inline>
																											<xsl:text>NE</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='NH'">
																										<fo:inline>
																											<xsl:text>NH</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='NJ'">
																										<fo:inline>
																											<xsl:text>NJ</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='NM'">
																										<fo:inline>
																											<xsl:text>NM</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='NV'">
																										<fo:inline>
																											<xsl:text>NV</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='NY'">
																										<fo:inline>
																											<xsl:text>NY</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='OH'">
																										<fo:inline>
																											<xsl:text>OH</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='OK'">
																										<fo:inline>
																											<xsl:text>OK</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='OR'">
																										<fo:inline>
																											<xsl:text>OR</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='PA'">
																										<fo:inline>
																											<xsl:text>PA</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='PR'">
																										<fo:inline>
																											<xsl:text>PR</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='RI'">
																										<fo:inline>
																											<xsl:text>RI</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='SC'">
																										<fo:inline>
																											<xsl:text>SC</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='SD'">
																										<fo:inline>
																											<xsl:text>SD</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='TN'">
																										<fo:inline>
																											<xsl:text>TN</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='TX'">
																										<fo:inline>
																											<xsl:text>TX</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='UT'">
																										<fo:inline>
																											<xsl:text>UT</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='VA'">
																										<fo:inline>
																											<xsl:text>VA</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='VI'">
																										<fo:inline>
																											<xsl:text>VI</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='VT'">
																										<fo:inline>
																											<xsl:text>VT</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='WA'">
																										<fo:inline>
																											<xsl:text>WA</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='WI'">
																										<fo:inline>
																											<xsl:text>WI</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='WV'">
																										<fo:inline>
																											<xsl:text>WV</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:when test="string(.)='WY'">
																										<fo:inline>
																											<xsl:text>WY</xsl:text>
																										</fo:inline>
																									</xsl:when>
																									<xsl:otherwise>
																										<fo:inline>
																											<xsl:text>AK</xsl:text>
																										</fo:inline>
																									</xsl:otherwise>
																								</xsl:choose>
																							</fo:inline>
																						</xsl:for-each>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="ipo:zip">
																							<fo:inline border="solid 1pt black" padding="2pt">
																								<xsl:value-of select="substring(string(.),1,26)"/>
																							</fo:inline>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</xsl:for-each>
															</xsl:when>
															<xsl:when test="n1:Location =&quot;EU&quot;">
																<xsl:for-each select="n1:Address_EU">
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border-spacing="4px">
																		<fo:table-column column-width="30%"/>
																		<fo:table-column column-width="70%"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline font-weight="bold">
																							<xsl:text>Street:</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<xsl:for-each select="ipo:street">
																							<fo:inline border="solid 1pt black" padding="2pt">
																								<xsl:value-of select="substring(string(.),1,26)"/>
																							</fo:inline>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline font-weight="bold">
																							<xsl:text>City:</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<xsl:for-each select="ipo:city">
																							<fo:inline border="solid 1pt black" padding="2pt">
																								<xsl:value-of select="substring(string(.),1,26)"/>
																							</fo:inline>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline font-weight="bold">
																							<xsl:text>Post Code:</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<xsl:for-each select="ipo:postcode">
																							<fo:inline border="solid 1pt black" padding="2pt">
																								<xsl:value-of select="substring(string(.),1,26)"/>
																							</fo:inline>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</xsl:for-each>
															</xsl:when>
														</xsl:choose>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="before">
													<fo:block>
														<fo:inline-container>
															<fo:block>
																<xsl:text>&#x2029;</xsl:text>
															</fo:block>
														</fo:inline-container>
														<fo:table table-layout="fixed" width="100%" border-spacing="4">
															<fo:table-column column-width="25%"/>
															<fo:table-column column-width="75%"/>
															<fo:table-body start-indent="0pt">
																<fo:table-row>
																	<fo:table-cell padding="2pt" display-align="center">
																		<fo:block>
																			<fo:inline font-weight="bold">
																				<xsl:text>Phone:</xsl:text>
																			</fo:inline>
																		</fo:block>
																	</fo:table-cell>
																	<fo:table-cell padding="2pt" display-align="center">
																		<fo:block>
																			<xsl:for-each select="n1:Phone">
																				<xsl:variable name="value-of-template">
																					<xsl:apply-templates/>
																				</xsl:variable>
																				<xsl:choose>
																					<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																						<fo:block>
																							<xsl:copy-of select="$value-of-template"/>
																						</fo:block>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline>
																							<xsl:copy-of select="$value-of-template"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																			</xsl:for-each>
																		</fo:block>
																	</fo:table-cell>
																</fo:table-row>
																<fo:table-row>
																	<fo:table-cell padding="2pt" display-align="center">
																		<fo:block>
																			<fo:inline font-weight="bold">
																				<xsl:text>Fax:</xsl:text>
																			</fo:inline>
																		</fo:block>
																	</fo:table-cell>
																	<fo:table-cell padding="2pt" display-align="center">
																		<fo:block>
																			<xsl:for-each select="n1:Fax">
																				<xsl:variable name="value-of-template">
																					<xsl:apply-templates/>
																				</xsl:variable>
																				<xsl:choose>
																					<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																						<fo:block>
																							<xsl:copy-of select="$value-of-template"/>
																						</fo:block>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline>
																							<xsl:copy-of select="$value-of-template"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																			</xsl:for-each>
																		</fo:block>
																	</fo:table-cell>
																</fo:table-row>
																<fo:table-row>
																	<fo:table-cell padding="2pt" display-align="center">
																		<fo:block>
																			<fo:inline font-weight="bold">
																				<xsl:text>E-mail:</xsl:text>
																			</fo:inline>
																		</fo:block>
																	</fo:table-cell>
																	<fo:table-cell padding="2pt" display-align="center">
																		<fo:block>
																			<xsl:for-each select="n1:EMail">
																				<fo:basic-link text-decoration="underline" color="blue">
																					<xsl:choose>
																						<xsl:when test="substring(string(concat(&apos;mailto:&apos;,.)), 1, 1) = '#'">
																							<xsl:attribute name="internal-destination">
																								<xsl:value-of select="substring(string(concat(&apos;mailto:&apos;,.)), 2)"/>
																							</xsl:attribute>
																						</xsl:when>
																						<xsl:otherwise>
																							<xsl:attribute name="external-destination">
																								<xsl:text>url(</xsl:text>
																								<xsl:call-template name="double-backslash">
																									<xsl:with-param name="text">
																										<xsl:value-of select="string(concat(&apos;mailto:&apos;,.))"/>
																									</xsl:with-param>
																									<xsl:with-param name="text-length">
																										<xsl:value-of select="string-length(string(concat(&apos;mailto:&apos;,.)))"/>
																									</xsl:with-param>
																								</xsl:call-template>
																								<xsl:text>)</xsl:text>
																							</xsl:attribute>
																						</xsl:otherwise>
																					</xsl:choose>
																					<xsl:variable name="value-of-template">
																						<xsl:apply-templates/>
																					</xsl:variable>
																					<xsl:choose>
																						<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																							<fo:block>
																								<xsl:copy-of select="$value-of-template"/>
																							</fo:block>
																						</xsl:when>
																						<xsl:otherwise>
																							<fo:inline>
																								<xsl:copy-of select="$value-of-template"/>
																							</fo:inline>
																						</xsl:otherwise>
																					</xsl:choose>
																				</fo:basic-link>
																			</xsl:for-each>
																		</fo:block>
																	</fo:table-cell>
																</fo:table-row>
															</fo:table-body>
														</fo:table>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</fo:table-body>
									</fo:table>
									<fo:block>
										<fo:leader leader-pattern="space"/>
									</fo:block>
									<xsl:choose>
										<xsl:when test="n1:Address">
											<xsl:for-each select="n1:Address">
												<xsl:for-each select="ipo:city">
													<xsl:variable name="value-of-template">
														<xsl:apply-templates/>
													</xsl:variable>
													<xsl:choose>
														<xsl:when test="contains(string($value-of-template),'&#x2029;')">
															<fo:block color="#004080" font-family="Arial" font-size="10pt" font-weight="bold" text-decoration="underline">
																<xsl:copy-of select="$value-of-template"/>
															</fo:block>
														</xsl:when>
														<xsl:otherwise>
															<fo:inline color="#004080" font-family="Arial" font-size="10pt" font-weight="bold" text-decoration="underline">
																<xsl:copy-of select="$value-of-template"/>
															</fo:inline>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:when>
										<xsl:when test="n1:Address_EU">
											<xsl:for-each select="n1:Address_EU">
												<xsl:for-each select="ipo:city">
													<xsl:variable name="value-of-template">
														<xsl:apply-templates/>
													</xsl:variable>
													<xsl:choose>
														<xsl:when test="contains(string($value-of-template),'&#x2029;')">
															<fo:block color="#004080" font-family="Arial" font-size="10pt" font-weight="bold" text-decoration="underline">
																<xsl:copy-of select="$value-of-template"/>
															</fo:block>
														</xsl:when>
														<xsl:otherwise>
															<fo:inline color="#004080" font-family="Arial" font-size="10pt" font-weight="bold" text-decoration="underline">
																<xsl:copy-of select="$value-of-template"/>
															</fo:inline>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:when>
									</xsl:choose>
									<fo:inline color="#004080" font-family="Arial" font-size="10pt" font-weight="bold" text-decoration="underline">
										<xsl:text> Office Summary:</xsl:text>
									</fo:inline>
									<fo:inline>
										<xsl:text>&#160; </xsl:text>
									</fo:inline>
									<fo:inline color="#004080" font-family="Arial" font-size="10pt" font-weight="bold">
										<xsl:value-of select="count(n1:Department)"/>
									</fo:inline>
									<fo:inline color="#004080" font-family="Arial" font-size="10pt" font-weight="bold">
										<xsl:text> department</xsl:text>
									</fo:inline>
									<xsl:if test="count(n1:Department) != 1">
										<fo:inline color="#004080" font-family="Arial" font-size="10pt" font-weight="bold">
											<xsl:text>s</xsl:text>
										</fo:inline>
									</xsl:if>
									<fo:inline color="#004080" font-family="Arial" font-size="10pt" font-weight="bold">
										<xsl:text>, </xsl:text>
									</fo:inline>
									<fo:inline color="#004080" font-family="Arial" font-size="10pt" font-weight="bold">
										<xsl:value-of select="count(n1:Department/n1:Person)"/>
									</fo:inline>
									<fo:inline color="#004080" font-family="Arial" font-size="10pt" font-weight="bold">
										<xsl:text> employee</xsl:text>
									</fo:inline>
									<xsl:if test="count(n1:Department/n1:Person) != 1">
										<fo:inline color="#004080" font-family="Arial" font-size="10pt" font-weight="bold">
											<xsl:text>s</xsl:text>
										</fo:inline>
									</xsl:if>
									<fo:inline color="#004080" font-family="Arial" font-size="10pt" font-weight="bold">
										<xsl:text>.</xsl:text>
									</fo:inline>
									<xsl:for-each select="n1:Desc">
										<xsl:for-each select="n1:para">
											<fo:block>
												<fo:leader leader-pattern="space"/>
											</fo:block>
											<fo:inline-container>
												<fo:block>
													<xsl:text>&#x2029;</xsl:text>
												</fo:block>
											</fo:inline-container>
											<fo:block margin="0pt">
												<fo:block>
													<xsl:variable name="value-of-template">
														<xsl:apply-templates/>
													</xsl:variable>
													<xsl:choose>
														<xsl:when test="contains(string($value-of-template),'&#x2029;')">
															<fo:block>
																<xsl:copy-of select="$value-of-template"/>
															</fo:block>
														</xsl:when>
														<xsl:otherwise>
															<fo:inline>
																<xsl:copy-of select="$value-of-template"/>
															</fo:inline>
														</xsl:otherwise>
													</xsl:choose>
												</fo:block>
											</fo:block>
										</xsl:for-each>
									</xsl:for-each>
									<xsl:for-each select="n1:Department">
										<fo:block>
											<fo:leader leader-pattern="space"/>
										</fo:block>
										<xsl:for-each select="n1:Name">
											<xsl:variable name="value-of-template">
												<xsl:apply-templates/>
											</xsl:variable>
											<xsl:choose>
												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
													<fo:block color="#D39658" font-family="Arial" font-weight="bold">
														<xsl:copy-of select="$value-of-template"/>
													</fo:block>
												</xsl:when>
												<xsl:otherwise>
													<fo:inline color="#D39658" font-family="Arial" font-weight="bold">
														<xsl:copy-of select="$value-of-template"/>
													</fo:inline>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
										<fo:inline>
											<xsl:text>&#160; </xsl:text>
										</fo:inline>
										<fo:inline color="#D39658" font-family="Arial" font-weight="bold">
											<xsl:text>( </xsl:text>
										</fo:inline>
										<fo:inline color="#D39658" font-family="Arial" font-weight="bold">
											<xsl:value-of select="count(n1:Person)"/>
										</fo:inline>
										<fo:inline color="#D39658" font-family="Arial" font-weight="bold">
											<xsl:text> )</xsl:text>
										</fo:inline>
										<fo:inline-container>
											<fo:block>
												<xsl:text>&#x2029;</xsl:text>
											</fo:block>
										</fo:inline-container>
										<xsl:if test="n1:Person">
											<fo:table table-layout="fixed" border="solid 1pt gray" width="100%" border-spacing="-1pt">
												<fo:table-column column-width="10%"/>
												<fo:table-column column-width="12%"/>
												<fo:table-column column-width="16%"/>
												<fo:table-column column-width="5%"/>
												<fo:table-column column-width="23%"/>
												<fo:table-column column-width="10%"/>
												<fo:table-column column-width="proportional-column-width(1)"/>
												<fo:table-column column-width="proportional-column-width(1)"/>
												<fo:table-column column-width="proportional-column-width(1)"/>
												<fo:table-header start-indent="0pt">
													<fo:table-row background-color="#D2C8AE">
														<fo:table-cell border="solid 1pt gray" number-rows-spanned="2" padding="3" background-color="#D2C8AE" text-align="center" display-align="center">
															<fo:block>
																<fo:inline color="#606060" font-family="Arial" font-weight="bold">
																	<xsl:text>First</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
														<fo:table-cell border="solid 1pt gray" number-rows-spanned="2" padding="3" background-color="#D2C8AE" text-align="center" display-align="center">
															<fo:block>
																<fo:inline color="#606060" font-family="Arial" font-weight="bold">
																	<xsl:text>Last</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
														<fo:table-cell border="solid 1pt gray" number-rows-spanned="2" padding="3" background-color="#D2C8AE" text-align="center" display-align="center">
															<fo:block>
																<fo:inline color="#606060" font-family="Arial" font-weight="bold">
																	<xsl:text>Title</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
														<fo:table-cell border="solid 1pt gray" number-rows-spanned="2" padding="3" background-color="#D2C8AE" text-align="center" display-align="center">
															<fo:block>
																<fo:inline color="#606060" font-family="Arial" font-weight="bold">
																	<xsl:text>Ext</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
														<fo:table-cell border="solid 1pt gray" number-rows-spanned="2" padding="3" background-color="#D2C8AE" text-align="center" display-align="center">
															<fo:block>
																<fo:inline color="#606060" font-family="Arial" font-weight="bold">
																	<xsl:text>EMail</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
														<fo:table-cell border="solid 1pt gray" number-rows-spanned="2" padding="3" background-color="#D2C8AE" text-align="center" display-align="center">
															<fo:block>
																<fo:inline color="#606060" font-family="Arial" font-weight="bold">
																	<xsl:text>Shares</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
														<fo:table-cell border="solid 1pt gray" number-columns-spanned="3" padding="3" text-align="center" display-align="center">
															<fo:block>
																<fo:inline color="#606060" font-family="Arial" font-weight="bold">
																	<xsl:text>Leave</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row>
														<fo:table-cell border="solid 1pt gray" padding="3" background-color="#D2C8AE" text-align="center" display-align="center">
															<fo:block>
																<fo:inline color="#606060" font-family="Arial" font-weight="bold">
																	<xsl:text>Total</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
														<fo:table-cell border="solid 1pt gray" padding="3" background-color="#D2C8AE" text-align="center" display-align="center">
															<fo:block>
																<fo:inline color="#606060" font-family="Arial" font-weight="bold">
																	<xsl:text>Used</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
														<fo:table-cell border="solid 1pt gray" padding="3" background-color="#D2C8AE" text-align="center" display-align="center">
															<fo:block>
																<fo:inline color="#606060" font-family="Arial" font-weight="bold">
																	<xsl:text>Left</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
												</fo:table-header>
												<fo:table-footer start-indent="0pt">
													<fo:table-row background-color="#F2F0E6">
														<fo:table-cell border="solid 1pt gray" number-columns-spanned="5" padding="3" text-align="left" display-align="before">
															<fo:block>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:text>Employees:&#160; </xsl:text>
																</fo:inline>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:value-of select="count(  n1:Person  )"/>
																</fo:inline>
																<fo:inline font-size="8pt">
																	<xsl:text>&#160;</xsl:text>
																</fo:inline>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:text>(</xsl:text>
																</fo:inline>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:value-of select="round ((count(  n1:Person  ) ) div ( count( ../n1:Department/ n1:Person  ) ) * 100)"/>
																</fo:inline>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:text>% of Office, </xsl:text>
																</fo:inline>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:value-of select="round ((count(  n1:Person  ) ) div ( count( ../../n1:Office/n1:Department/ n1:Person  ) ) * 100)"/>
																</fo:inline>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:text>% of Company)</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
														<fo:table-cell border="solid 1pt gray" number-columns-spanned="4" padding="3" text-align="left" display-align="center">
															<fo:block>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:text>Shares: </xsl:text>
																</fo:inline>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:value-of select="sum(  n1:Person/n1:Shares  )"/>
																</fo:inline>
																<fo:inline font-size="8pt">
																	<xsl:text>&#160;</xsl:text>
																</fo:inline>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:text>(</xsl:text>
																</fo:inline>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:value-of select="round((sum(  n1:Person/n1:Shares  ) ) div (sum(../n1:Department/ n1:Person/n1:Shares ) ) * 100)"/>
																</fo:inline>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:text>% of Office, </xsl:text>
																</fo:inline>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:value-of select="round((sum(  n1:Person/n1:Shares  ) ) div (sum(../../n1:Office/n1:Department/ n1:Person/n1:Shares  )) * 100)"/>
																</fo:inline>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:text>% of Company)</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row background-color="#F2F0E6">
														<fo:table-cell border="solid 1pt gray" number-columns-spanned="9" padding="3" text-align="left" display-align="center">
															<fo:block>
																<fo:inline color="#004080" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:text>Non-Shareholders: </xsl:text>
																</fo:inline>
																<fo:inline color="#004040" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:text>&#160;</xsl:text>
																</fo:inline>
																<xsl:for-each select="n1:Person">
																	<xsl:if test="n1:Shares &lt;= 0 or not (n1:Shares)">
																		<xsl:for-each select="n1:First">
																			<xsl:variable name="value-of-template">
																				<xsl:apply-templates/>
																			</xsl:variable>
																			<xsl:choose>
																				<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																					<fo:block color="#004040" font-family="Arial" font-size="8pt" font-weight="bold">
																						<xsl:copy-of select="$value-of-template"/>
																					</fo:block>
																				</xsl:when>
																				<xsl:otherwise>
																					<fo:inline color="#004040" font-family="Arial" font-size="8pt" font-weight="bold">
																						<xsl:copy-of select="$value-of-template"/>
																					</fo:inline>
																				</xsl:otherwise>
																			</xsl:choose>
																		</xsl:for-each>
																		<fo:inline color="#004040" font-family="Arial" font-size="8pt" font-weight="bold">
																			<xsl:text>&#160;</xsl:text>
																		</fo:inline>
																		<xsl:for-each select="n1:Last">
																			<xsl:variable name="value-of-template">
																				<xsl:apply-templates/>
																			</xsl:variable>
																			<xsl:choose>
																				<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																					<fo:block color="#004040" font-family="Arial" font-size="8pt" font-weight="bold">
																						<xsl:copy-of select="$value-of-template"/>
																					</fo:block>
																				</xsl:when>
																				<xsl:otherwise>
																					<fo:inline color="#004040" font-family="Arial" font-size="8pt" font-weight="bold">
																						<xsl:copy-of select="$value-of-template"/>
																					</fo:inline>
																				</xsl:otherwise>
																			</xsl:choose>
																		</xsl:for-each>
																		<xsl:if test="following-sibling::n1:Person[n1:Shares&lt;=0 or not(n1:Shares)]">
																			<fo:inline color="#004040" font-family="Arial" font-size="8pt" font-weight="bold">
																				<xsl:text>, </xsl:text>
																			</fo:inline>
																		</xsl:if>
																	</xsl:if>
																</xsl:for-each>
																<xsl:if test="count(  n1:Person  ) = count(  n1:Person [n1:Shares&gt;0] )">
																	<fo:inline color="#004040" font-family="Arial" font-size="8pt" font-weight="bold">
																		<xsl:text>None</xsl:text>
																	</fo:inline>
																</xsl:if>
																<fo:inline color="#004040" font-family="Arial" font-size="8pt" font-weight="bold">
																	<xsl:text>.</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
												</fo:table-footer>
												<fo:table-body start-indent="0pt">
													<xsl:for-each select="n1:Person">
														<fo:table-row>
															<fo:table-cell border="solid 1pt gray" padding="3" display-align="center">
																<fo:block>
																	<xsl:for-each select="n1:First">
																		<xsl:choose>
																			<xsl:when test="../n1:Shares &gt; 0">
																				<xsl:variable name="value-of-template">
																					<xsl:apply-templates/>
																				</xsl:variable>
																				<xsl:choose>
																					<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																						<fo:block font-size="10pt" font-weight="bold">
																							<xsl:copy-of select="$value-of-template"/>
																						</fo:block>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline font-size="10pt" font-weight="bold">
																							<xsl:copy-of select="$value-of-template"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																			</xsl:when>
																			<xsl:otherwise>
																				<xsl:variable name="value-of-template">
																					<xsl:apply-templates/>
																				</xsl:variable>
																				<xsl:choose>
																					<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																						<fo:block font-size="10pt">
																							<xsl:copy-of select="$value-of-template"/>
																						</fo:block>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline font-size="10pt">
																							<xsl:copy-of select="$value-of-template"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell border="solid 1pt gray" padding="3" display-align="center">
																<fo:block>
																	<xsl:for-each select="n1:Last">
																		<xsl:choose>
																			<xsl:when test="../n1:Shares &gt; 0">
																				<xsl:variable name="value-of-template">
																					<xsl:apply-templates/>
																				</xsl:variable>
																				<xsl:choose>
																					<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																						<fo:block font-size="10pt" font-weight="bold">
																							<xsl:copy-of select="$value-of-template"/>
																						</fo:block>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline font-size="10pt" font-weight="bold">
																							<xsl:copy-of select="$value-of-template"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																			</xsl:when>
																			<xsl:otherwise>
																				<xsl:variable name="value-of-template">
																					<xsl:apply-templates/>
																				</xsl:variable>
																				<xsl:choose>
																					<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																						<fo:block font-size="10pt">
																							<xsl:copy-of select="$value-of-template"/>
																						</fo:block>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline font-size="10pt">
																							<xsl:copy-of select="$value-of-template"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell border="solid 1pt gray" padding="3" display-align="center">
																<fo:block>
																	<xsl:for-each select="n1:Title">
																		<xsl:variable name="value-of-template">
																			<xsl:apply-templates/>
																		</xsl:variable>
																		<xsl:choose>
																			<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																				<fo:block font-size="10pt">
																					<xsl:copy-of select="$value-of-template"/>
																				</fo:block>
																			</xsl:when>
																			<xsl:otherwise>
																				<fo:inline font-size="10pt">
																					<xsl:copy-of select="$value-of-template"/>
																				</fo:inline>
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell border="solid 1pt gray" padding="3" text-align="center" display-align="center">
																<fo:block>
																	<xsl:for-each select="n1:PhoneExt">
																		<xsl:variable name="value-of-template">
																			<xsl:apply-templates/>
																		</xsl:variable>
																		<xsl:choose>
																			<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																				<fo:block font-size="10pt">
																					<xsl:copy-of select="$value-of-template"/>
																				</fo:block>
																			</xsl:when>
																			<xsl:otherwise>
																				<fo:inline font-size="10pt">
																					<xsl:copy-of select="$value-of-template"/>
																				</fo:inline>
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell border="solid 1pt gray" padding="3" display-align="center">
																<fo:block>
																	<xsl:for-each select="n1:EMail">
																		<fo:basic-link text-decoration="underline" color="blue">
																			<xsl:choose>
																				<xsl:when test="substring(string(concat(&apos;mailto:&apos;,.)), 1, 1) = '#'">
																					<xsl:attribute name="internal-destination">
																						<xsl:value-of select="substring(string(concat(&apos;mailto:&apos;,.)), 2)"/>
																					</xsl:attribute>
																				</xsl:when>
																				<xsl:otherwise>
																					<xsl:attribute name="external-destination">
																						<xsl:text>url(</xsl:text>
																						<xsl:call-template name="double-backslash">
																							<xsl:with-param name="text">
																								<xsl:value-of select="string(concat(&apos;mailto:&apos;,.))"/>
																							</xsl:with-param>
																							<xsl:with-param name="text-length">
																								<xsl:value-of select="string-length(string(concat(&apos;mailto:&apos;,.)))"/>
																							</xsl:with-param>
																						</xsl:call-template>
																						<xsl:text>)</xsl:text>
																					</xsl:attribute>
																				</xsl:otherwise>
																			</xsl:choose>
																			<xsl:variable name="value-of-template">
																				<xsl:apply-templates/>
																			</xsl:variable>
																			<xsl:choose>
																				<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																					<fo:block font-size="10pt">
																						<xsl:copy-of select="$value-of-template"/>
																					</fo:block>
																				</xsl:when>
																				<xsl:otherwise>
																					<fo:inline font-size="10pt">
																						<xsl:copy-of select="$value-of-template"/>
																					</fo:inline>
																				</xsl:otherwise>
																			</xsl:choose>
																		</fo:basic-link>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell border="solid 1pt gray" padding="3" text-align="center" display-align="center">
																<fo:block>
																	<xsl:for-each select="n1:Shares">
																		<xsl:variable name="value-of-template">
																			<xsl:apply-templates/>
																		</xsl:variable>
																		<xsl:choose>
																			<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																				<fo:block font-size="10pt">
																					<xsl:copy-of select="$value-of-template"/>
																				</fo:block>
																			</xsl:when>
																			<xsl:otherwise>
																				<fo:inline font-size="10pt">
																					<xsl:copy-of select="$value-of-template"/>
																				</fo:inline>
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell border="solid 1pt gray" padding="3" text-align="center" display-align="center">
																<fo:block>
																	<xsl:for-each select="n1:LeaveTotal">
																		<xsl:variable name="value-of-template">
																			<xsl:apply-templates/>
																		</xsl:variable>
																		<xsl:choose>
																			<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																				<fo:block font-size="10pt">
																					<xsl:copy-of select="$value-of-template"/>
																				</fo:block>
																			</xsl:when>
																			<xsl:otherwise>
																				<fo:inline font-size="10pt">
																					<xsl:copy-of select="$value-of-template"/>
																				</fo:inline>
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell border="solid 1pt gray" padding="3" text-align="center" display-align="center">
																<fo:block>
																	<xsl:for-each select="n1:LeaveUsed">
																		<xsl:variable name="value-of-template">
																			<xsl:apply-templates/>
																		</xsl:variable>
																		<xsl:choose>
																			<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																				<fo:block font-size="10pt">
																					<xsl:copy-of select="$value-of-template"/>
																				</fo:block>
																			</xsl:when>
																			<xsl:otherwise>
																				<fo:inline font-size="10pt">
																					<xsl:copy-of select="$value-of-template"/>
																				</fo:inline>
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell border="solid 1pt gray" padding="3" text-align="center" display-align="center">
																<fo:block>
																	<fo:inline font-size="10pt">
																		<xsl:value-of select="n1:LeaveTotal - n1:LeaveUsed"/>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</xsl:for-each>
												</fo:table-body>
											</fo:table>
										</xsl:if>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</fo:block>
					<fo:block id="SV_RefID_PageTotal"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template match="n1:bold">
		<xsl:variable name="value-of-template">
			<xsl:apply-templates/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="contains(string($value-of-template),'&#x2029;')">
				<fo:block font-weight="bold">
					<xsl:copy-of select="$value-of-template"/>
				</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<fo:inline font-weight="bold">
					<xsl:copy-of select="$value-of-template"/>
				</fo:inline>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="n1:italic">
		<xsl:variable name="value-of-template">
			<xsl:apply-templates/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="contains(string($value-of-template),'&#x2029;')">
				<fo:block font-style="italic">
					<xsl:copy-of select="$value-of-template"/>
				</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<fo:inline font-style="italic">
					<xsl:copy-of select="$value-of-template"/>
				</fo:inline>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="double-backslash">
		<xsl:param name="text"/>
		<xsl:param name="text-length"/>
		<xsl:variable name="text-after-bs" select="substring-after($text, '\')"/>
		<xsl:variable name="text-after-bs-length" select="string-length($text-after-bs)"/>
		<xsl:choose>
			<xsl:when test="$text-after-bs-length = 0">
				<xsl:choose>
					<xsl:when test="substring($text, $text-length) = '\'">
						<xsl:value-of select="concat(substring($text,1,$text-length - 1), '\\')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$text"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat(substring($text,1,$text-length - $text-after-bs-length - 1), '\\')"/>
				<xsl:call-template name="double-backslash">
					<xsl:with-param name="text" select="$text-after-bs"/>
					<xsl:with-param name="text-length" select="$text-after-bs-length"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
