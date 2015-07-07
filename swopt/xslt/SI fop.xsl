<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:param name="logoImg"/>
<xsl:key name="by-row" match="Detail" use="@Row"/>

<xsl:attribute-set name="tablecell-style">
	<xsl:attribute name="border">solid</xsl:attribute>
	<xsl:attribute name="border-width">0.1mm</xsl:attribute>
	<xsl:attribute name="text-align">right</xsl:attribute>
	<xsl:attribute name="padding-top">1mm</xsl:attribute>
</xsl:attribute-set>
		
<xsl:attribute-set name="text-style">
	<xsl:attribute name="font-size">14pt</xsl:attribute>
	<xsl:attribute name="font-family">Times New Roman</xsl:attribute>
	<xsl:attribute name="font-weight">bold</xsl:attribute>
</xsl:attribute-set>
	
<xsl:attribute-set name="text1-style">
	<xsl:attribute name="font-size">10.3pt</xsl:attribute>
	<xsl:attribute name="font-family">Times New Roman</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="text2-style">
	<xsl:attribute name="font-size">10.3pt</xsl:attribute>
	<xsl:attribute name="font-family">Times New Roman</xsl:attribute>
	<xsl:attribute name="font-weight">bold</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="text3-style">
	<xsl:attribute name="font-size">8pt</xsl:attribute>
	<xsl:attribute name="font-family">Times New Roman</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="td_align_right">
	<xsl:attribute name="border-top-style">solid</xsl:attribute>
	<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
	<xsl:attribute name="border-left-style">solid</xsl:attribute>
	<xsl:attribute name="border-right-style">solid</xsl:attribute>
	<xsl:attribute name="text-align">right</xsl:attribute>
</xsl:attribute-set>
 
 <xsl:template match="Documents">
	<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
		<xsl:element name="fo:simple-page-master">
				<xsl:attribute name="master-name">A4</xsl:attribute>
				<xsl:attribute name="page-width">21cm</xsl:attribute>
				<xsl:attribute name="page-height">29.7cm</xsl:attribute>
				<xsl:attribute name="margin-top">1cm</xsl:attribute>
				<xsl:attribute name="margin-left">1cm</xsl:attribute>
				<xsl:attribute name="margin-right">1cm</xsl:attribute>
				<xsl:attribute name="margin-bottom">1cm</xsl:attribute>
					
					
					<xsl:element name="fo:region-body">
						<xsl:attribute name="margin-top">11.1cm</xsl:attribute>
						<xsl:attribute name="margin-bottom">4cm</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-before">
						<xsl:attribute name="extent">11.3cm</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-after">
						<xsl:attribute name="extent">4cm</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-start">
						<xsl:attribute name="extent">0cm</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-end">
						<xsl:attribute name="extent">0cm</xsl:attribute>
					</xsl:element>

			</xsl:element>
			
			<xsl:element name="fo:page-sequence">
				<xsl:attribute name="master-reference">A4</xsl:attribute>
				
				 <xsl:element name="fo:static-content">
					<xsl:attribute name="flow-name">xsl-region-before</xsl:attribute>
					<fo:block-container height="8.3cm">
					<xsl:apply-templates select="//Header"/> 
					</fo:block-container>
					<xsl:call-template name="CreditLimit"/>
					<xsl:call-template name="tableHeader"/>
				</xsl:element>
				
				 <xsl:element name="fo:static-content">
					<xsl:attribute name="flow-name">xsl-region-after</xsl:attribute>
						<xsl:element name="fo:block" use-attribute-sets="text3-style">
							<xsl:apply-templates select="//Header/ReportOptions"/> 
							Page <xsl:element name="fo:page-number"/> of <fo:page-number-citation ref-id='total-page'/>
						</xsl:element>
					</xsl:element>
								
				<xsl:element name="fo:flow">
					<xsl:attribute name="flow-name">xsl-region-body</xsl:attribute>
					<xsl:apply-templates select="//Details"/> 
					<xsl:element name="fo:block">
						<xsl:attribute name="id">total-page</xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
	</fo:root>
 </xsl:template>
 
 <xsl:template match="Header">
	<xsl:element name="fo:table">
		<xsl:element name="fo:table-column"></xsl:element>
		<xsl:element name="fo:table-body">
			<xsl:element name="fo:table-row">
				<xsl:element name="fo:table-cell">
					<xsl:element name="fo:list-block">
						<xsl:element name="fo:list-item">
							
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:element>
 </xsl:template>
 
</xsl:stylesheet>