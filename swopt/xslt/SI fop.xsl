<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:param name="logoImg"/>
<xsl:key name="by-row" match="Detail" use="@Row"/>

<xsl:attribute-set name="tablecell-style">
	<xsl:attribute name="border">solid</xsl:attribute>
	<xsl:attribute name="border-width">0.1mm</xsl:attribute>
	<xsl:attribute name="text-align">right</xsl:attribute>
	<xsl:attribute name="padding-top">1mm</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="align-right"><xsl:attribute name="text-align">right</xsl:attribute></xsl:attribute-set>
<xsl:attribute-set name="align-center"><xsl:attribute name="text-align">center</xsl:attribute></xsl:attribute-set>
		
<xsl:attribute-set name="text-large">
	<xsl:attribute name="font-size">14pt</xsl:attribute>
	<xsl:attribute name="font-family">Times New Roman</xsl:attribute>
	<xsl:attribute name="font-weight">bold</xsl:attribute>
	
</xsl:attribute-set>
	
<xsl:attribute-set name="text-normal">
	<xsl:attribute name="font-size">10.3pt</xsl:attribute>
	<xsl:attribute name="font-family">Times New Roman</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="text-normal-bold">
	<xsl:attribute name="font-size">10.3pt</xsl:attribute>
	<xsl:attribute name="font-family">Times New Roman</xsl:attribute>
	<xsl:attribute name="font-weight">bold</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="text-normal-bold-center">
	<xsl:attribute name="font-size">10.3pt</xsl:attribute>
	<xsl:attribute name="font-family">Times New Roman</xsl:attribute>
	<xsl:attribute name="font-weight">bold</xsl:attribute>
	<xsl:attribute name="text-align">center</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="text-small">
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
		<xsl:element name="fo:layout-master-set">
			<xsl:element name="fo:simple-page-master">
				<xsl:attribute name="master-name">A4</xsl:attribute>
				<xsl:attribute name="page-width">21cm</xsl:attribute>
				<xsl:attribute name="page-height">29.7cm</xsl:attribute>
				<xsl:attribute name="margin-top">1cm</xsl:attribute>
				<xsl:attribute name="margin-left">1cm</xsl:attribute>
				<xsl:attribute name="margin-right">1cm</xsl:attribute>
				<xsl:attribute name="margin-bottom">1cm</xsl:attribute>
					
					
					<xsl:element name="fo:region-body">
						<xsl:attribute name="margin-top">6.1cm</xsl:attribute>
						<xsl:attribute name="margin-bottom">4cm</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-before">
						<xsl:attribute name="extent">6.3cm</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-after">
						<xsl:attribute name="extent">1cm</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-start">
						<xsl:attribute name="extent">0cm</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-end">
						<xsl:attribute name="extent">0cm</xsl:attribute>
					</xsl:element>

			</xsl:element>
			<xsl:element name="fo:simple-page-master">
				<xsl:attribute name="master-name">A4-last</xsl:attribute>
				<xsl:attribute name="page-width">21cm</xsl:attribute>
				<xsl:attribute name="page-height">29.7cm</xsl:attribute>
				<xsl:attribute name="margin-top">1cm</xsl:attribute>
				<xsl:attribute name="margin-left">1cm</xsl:attribute>
				<xsl:attribute name="margin-right">1cm</xsl:attribute>
				<xsl:attribute name="margin-bottom">1cm</xsl:attribute>
					
					
					<xsl:element name="fo:region-body">
						<xsl:attribute name="margin-top">6.1cm</xsl:attribute>
						<xsl:attribute name="margin-bottom">4cm</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-before">
						<xsl:attribute name="extent">6.3cm</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-after">
						<xsl:attribute name="region-name">last-page-footer</xsl:attribute>
						<xsl:attribute name="extent">4cm</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-start">
						<xsl:attribute name="extent">0cm</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-end">
						<xsl:attribute name="extent">0cm</xsl:attribute>
					</xsl:element>

			</xsl:element>
			<xsl:element name="fo:page-sequence-master">
				<xsl:attribute name="master-name">pages</xsl:attribute>
				<xsl:element name="fo:repeatable-page-master-alternatives">
					<xsl:element name="fo:conditional-page-master-reference">
						<xsl:attribute name="page-position">last</xsl:attribute>
						<xsl:attribute name="master-reference">A4-last</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:conditional-page-master-reference">
						<xsl:attribute name="master-reference">A4</xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>	
		<xsl:element name="fo:page-sequence">
			<xsl:attribute name="master-reference">pages</xsl:attribute>
			
			 <xsl:element name="fo:static-content">
				<xsl:attribute name="flow-name">xsl-region-before</xsl:attribute>
				<fo:block-container height="5cm">
				<xsl:apply-templates select="Document/Header"/> 
				</fo:block-container>
			</xsl:element>
			
			 <xsl:element name="fo:static-content">
				<xsl:attribute name="flow-name">xsl-region-after</xsl:attribute>
				<xsl:element name="fo:block" use-attribute-sets="text-small">
					Page <xsl:element name="fo:page-number"/> of <fo:page-number-citation ref-id='total-page'/>
				</xsl:element>
			</xsl:element>
							
			<xsl:element name="fo:static-content">
				<xsl:attribute name="flow-name">last-page-footer</xsl:attribute>
				<xsl:element name="fo:block" use-attribute-sets="text-normal">
					<xsl:element name="fo:block">This is a computer generated document. No signature required.</xsl:element>
					<xsl:element name="fo:block">
						<xsl:element name="fo:table">
							<xsl:element name="fo:table-column"></xsl:element>
							<xsl:element name="fo:table-column"></xsl:element>
							<xsl:element name="fo:table-body">
								<xsl:element name="fo:table-row">
									<xsl:element name="fo:table-cell">
										<xsl:attribute name="border">solid</xsl:attribute>
										<xsl:attribute name="margin">2mm</xsl:attribute>
										<xsl:element name="fo:block">TRANSPORTER acknowledgement - Stamp &amp; Sign</xsl:element>
										<xsl:element name="fo:block">
											<xsl:attribute name="margin-bottom">2cm</xsl:attribute>
											Goods Collected By:</xsl:element>
										<xsl:element name="fo:table">
											<xsl:element name="fo:table-column"><xsl:attribute name="column-width">20%</xsl:attribute></xsl:element>
											<xsl:element name="fo:table-column"><xsl:attribute name="column-width">30%</xsl:attribute></xsl:element>
											<xsl:element name="fo:table-column"><xsl:attribute name="column-width">20%</xsl:attribute></xsl:element>
											<xsl:element name="fo:table-column"><xsl:attribute name="column-width">30%</xsl:attribute></xsl:element>
											<xsl:element name="fo:table-body">
												<xsl:element name="fo:table-row">
													<xsl:element name="fo:table-cell"><xsl:element name="fo:block">Name</xsl:element></xsl:element>
													<xsl:element name="fo:table-cell"><xsl:element name="fo:block">:</xsl:element></xsl:element>
													<xsl:element name="fo:table-cell"><xsl:element name="fo:block">IC No.</xsl:element></xsl:element>
													<xsl:element name="fo:table-cell"><xsl:element name="fo:block">:</xsl:element></xsl:element>
												</xsl:element>
												<xsl:element name="fo:table-row">
													<xsl:element name="fo:table-cell"><xsl:element name="fo:block">Name</xsl:element></xsl:element>
													<xsl:element name="fo:table-cell"><xsl:element name="fo:block">:</xsl:element></xsl:element>
												</xsl:element>
											</xsl:element>
										</xsl:element>
									</xsl:element>
									<xsl:element name="fo:table-cell">
										<xsl:attribute name="border">solid</xsl:attribute>
										<xsl:attribute name="margin">2mm</xsl:attribute>
										<xsl:element name="fo:block">CUSTOMER acknowledgement - Stamp &amp; Sign</xsl:element>
										<xsl:element name="fo:block">
											<xsl:attribute name="margin-bottom">2cm</xsl:attribute>
											Goods Received By:</xsl:element>
										<xsl:element name="fo:table">
											<xsl:element name="fo:table-column"><xsl:attribute name="column-width">20%</xsl:attribute></xsl:element>
											<xsl:element name="fo:table-column"><xsl:attribute name="column-width">30%</xsl:attribute></xsl:element>
											<xsl:element name="fo:table-column"><xsl:attribute name="column-width">20%</xsl:attribute></xsl:element>
											<xsl:element name="fo:table-column"><xsl:attribute name="column-width">30%</xsl:attribute></xsl:element>
											<xsl:element name="fo:table-body">
												<xsl:element name="fo:table-row">
													<xsl:element name="fo:table-cell"><xsl:element name="fo:block">Name</xsl:element></xsl:element>
													<xsl:element name="fo:table-cell"><xsl:element name="fo:block">:</xsl:element></xsl:element>
													<xsl:element name="fo:table-cell"><xsl:element name="fo:block">IC No.</xsl:element></xsl:element>
													<xsl:element name="fo:table-cell"><xsl:element name="fo:block">:</xsl:element></xsl:element>
												</xsl:element>
												<xsl:element name="fo:table-row">
													<xsl:element name="fo:table-cell"><xsl:element name="fo:block">Name</xsl:element></xsl:element>
													<xsl:element name="fo:table-cell"><xsl:element name="fo:block">:</xsl:element></xsl:element>
												</xsl:element>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:element>
				<xsl:element name="fo:block" use-attribute-sets="text-small">
					Page <xsl:element name="fo:page-number"/> of <fo:page-number-citation ref-id='total-page'/>
				</xsl:element>
			</xsl:element>
			
			<xsl:element name="fo:flow">
				<xsl:attribute name="flow-name">xsl-region-body</xsl:attribute>
				<xsl:apply-templates select="Document/Details"/> 
				<xsl:apply-templates select="Document/Summarys"/>
				<xsl:element name="fo:block">
					<xsl:attribute name="id">total-page</xsl:attribute>
				</xsl:element>
			</xsl:element>
			
		</xsl:element>
	</fo:root>
 </xsl:template>
 
 <xsl:template match="Header">
	<xsl:element name="fo:block">
		<xsl:element name="fo:inline" use-attribute-sets="text-large"><xsl:value-of select="OrganisationName"/></xsl:element>&#160;
		<xsl:element name="fo:inline" use-attribute-sets="text-normal"><xsl:value-of select="OrganisationRegNo"/>&#160;
			<xsl:value-of select="GstRegNo"/></xsl:element>
	</xsl:element>
	<xsl:element name="fo:block" use-attribute-sets="text-normal-bold"><xsl:value-of select="OrganisationGroup"/></xsl:element>
	<xsl:element name="fo:block" use-attribute-sets="text-normal"><xsl:value-of select="OrganisationAddress"/></xsl:element>
	<xsl:element name="fo:block" use-attribute-sets="text-normal">
		Tel : <xsl:value-of select="OrganisationPhoneNo"/>&#160;
		Fax : <xsl:value-of select="OrganisationFaxNo"/></xsl:element>
	<xsl:element name="fo:block"><xsl:attribute name="margin-bottom">4mm</xsl:attribute></xsl:element>
	<xsl:element name="fo:table" use-attribute-sets="text-normal">
		<xsl:element name="fo:table-column"><xsl:attribute name="column-width">70%</xsl:attribute></xsl:element>
		<xsl:element name="fo:table-column"><xsl:attribute name="column-width">30%</xsl:attribute></xsl:element>
		<xsl:element name="fo:table-body">
			<xsl:element name="fo:table-row">
				<xsl:element name="fo:table-cell">
					<xsl:element name="fo:block" use-attribute-sets="text-normal">
						<xsl:value-of select="AccountName"/>
						<xsl:element name="fo:block"><xsl:value-of select="ClientMailAddr1"/></xsl:element>
						<xsl:element name="fo:block"><xsl:value-of select="ClientMailAddr2"/></xsl:element>
						<xsl:element name="fo:block"><xsl:value-of select="ClientMailAddr3"/></xsl:element>
						<xsl:element name="fo:block"><xsl:attribute name="margin-bottom">4mm</xsl:attribute></xsl:element>
						<xsl:element name="fo:block"><xsl:value-of select="ClientContactNo"/></xsl:element>
						<xsl:element name="fo:block"><xsl:value-of select="ClientContactPerson"/></xsl:element>
					</xsl:element>
				</xsl:element>
				<xsl:element name="fo:table-cell">
					<xsl:element name="fo:block">
						<xsl:element name="fo:table">
							<xsl:element name="fo:table-column"><xsl:attribute name="column-width">40%</xsl:attribute></xsl:element>
							<xsl:element name="fo:table-column"><xsl:attribute name="column-width">60%</xsl:attribute></xsl:element>
							<xsl:element name="fo:table-body">
								<xsl:element name="fo:table-row">
									<xsl:element name="fo:table-cell"><xsl:element name="fo:block">Number</xsl:element></xsl:element>
									<xsl:element name="fo:table-cell"><xsl:element name="fo:block">: <xsl:value-of select="SINo"/></xsl:element></xsl:element>
								</xsl:element>
								<xsl:element name="fo:table-row">
									<xsl:element name="fo:table-cell"><xsl:element name="fo:block">Date</xsl:element></xsl:element>
									<xsl:element name="fo:table-cell"><xsl:element name="fo:block">: <xsl:value-of select="SIDate"/></xsl:element></xsl:element>
								</xsl:element>
								<xsl:element name="fo:table-row">
									<xsl:element name="fo:table-cell"><xsl:element name="fo:block">Reference No.</xsl:element></xsl:element>
									<xsl:element name="fo:table-cell"><xsl:element name="fo:block">: <xsl:value-of select="ClientSupplierReference"/></xsl:element></xsl:element>
								</xsl:element>
								<xsl:element name="fo:table-row">
									<xsl:element name="fo:table-cell"><xsl:element name="fo:block">Page No.</xsl:element></xsl:element>
									<xsl:element name="fo:table-cell"><xsl:element name="fo:block">: <xsl:value-of select="PageNo"/></xsl:element></xsl:element>
								</xsl:element>
								<xsl:element name="fo:table-row">
									<xsl:element name="fo:table-cell"><xsl:element name="fo:block">No. of Print</xsl:element></xsl:element>
									<xsl:element name="fo:table-cell"><xsl:element name="fo:block">: <xsl:value-of select="PrintSequence"/></xsl:element></xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:element>
	<xsl:element name="fo:block"><xsl:attribute name="margin-bottom">4mm</xsl:attribute></xsl:element>
	<xsl:element name="fo:block" use-attribute-sets="text-normal-bold-center">
		TAX INVOICE
	</xsl:element>
	<!---->
 </xsl:template>
 
 <xsl:template match="Details">
	<xsl:element name="fo:table" use-attribute-sets="text-normal">
		<xsl:element name="fo:table-column"><xsl:attribute name="column-width">5%</xsl:attribute></xsl:element>
		<xsl:element name="fo:table-column"><xsl:attribute name="column-width">15%</xsl:attribute></xsl:element>
		<xsl:element name="fo:table-column"><xsl:attribute name="column-width">15%</xsl:attribute></xsl:element>
		<xsl:element name="fo:table-column"><xsl:attribute name="column-width">25%</xsl:attribute></xsl:element>
		<xsl:element name="fo:table-column"><xsl:attribute name="column-width">10%</xsl:attribute></xsl:element>
		<xsl:element name="fo:table-column"><xsl:attribute name="column-width">10%</xsl:attribute></xsl:element>
		<xsl:element name="fo:table-column"><xsl:attribute name="column-width">10%</xsl:attribute></xsl:element>
		<xsl:element name="fo:table-column"><xsl:attribute name="column-width">10%</xsl:attribute></xsl:element>
		<xsl:element name="fo:table-body">
			<xsl:element name="fo:table-row">
				<xsl:attribute name="border-top">solid</xsl:attribute>
				<xsl:attribute name="border-bottom">solid</xsl:attribute>
				<xsl:element name="fo:table-cell"><xsl:element name="fo:block">No.</xsl:element></xsl:element>
				<xsl:element name="fo:table-cell"><xsl:element name="fo:block">D.O. No.</xsl:element>
					<xsl:element name="fo:block">Your Ref.</xsl:element></xsl:element>
				<xsl:element name="fo:table-cell"><xsl:element name="fo:block">Packing List</xsl:element></xsl:element>
				<xsl:element name="fo:table-cell"><xsl:element name="fo:block">Description</xsl:element>
					<xsl:element name="fo:block">Part No/Item Code</xsl:element></xsl:element>
				<xsl:element name="fo:table-cell" use-attribute-sets="align-right"><xsl:element name="fo:block">Qty.</xsl:element></xsl:element>
				<xsl:element name="fo:table-cell" use-attribute-sets="align-center"><xsl:element name="fo:block">UOM</xsl:element></xsl:element>
				<xsl:element name="fo:table-cell" use-attribute-sets="align-right"><xsl:element name="fo:block">Unit Price (<xsl:value-of select="//Header/CurrencyCode"/>)</xsl:element></xsl:element>
				<xsl:element name="fo:table-cell" use-attribute-sets="align-right"><xsl:element name="fo:block">Amount (<xsl:value-of select="//Header/CurrencyCode"/>)</xsl:element></xsl:element>
			</xsl:element>
			<xsl:apply-templates select="Detail"/>
		</xsl:element>
	</xsl:element>
	
 </xsl:template>
 <xsl:template match="Detail">
	<xsl:element name="fo:table-row">
		<xsl:element name="fo:table-cell"><xsl:element name="fo:block"><xsl:number/></xsl:element></xsl:element>
		<xsl:element name="fo:table-cell"><xsl:element name="fo:block"><xsl:value-of select="SIDOReference"/></xsl:element></xsl:element>
		<xsl:element name="fo:table-cell"><xsl:element name="fo:block"><xsl:value-of select="ItemList"/></xsl:element></xsl:element>
		<xsl:element name="fo:table-cell"><xsl:element name="fo:block"><xsl:value-of select="ItemDescription"/></xsl:element></xsl:element>
		<xsl:element name="fo:table-cell" use-attribute-sets="align-right"><xsl:element name="fo:block"><xsl:value-of select="ItemQuantity"/></xsl:element></xsl:element>
		<xsl:element name="fo:table-cell" use-attribute-sets="align-center"><xsl:element name="fo:block"><xsl:value-of select="ItemUOM"/></xsl:element></xsl:element>
		<xsl:element name="fo:table-cell" use-attribute-sets="align-right"><xsl:element name="fo:block"><xsl:value-of select="ItemPrice"/></xsl:element></xsl:element>
		<xsl:element name="fo:table-cell" use-attribute-sets="align-right"><xsl:element name="fo:block"><xsl:value-of select="ItemAmount"/></xsl:element></xsl:element>
	</xsl:element>
 </xsl:template>
 
 <xsl:template match="Summarys">
	<xsl:element name="fo:table">
		<xsl:element name="fo:table-column"><xsl:attribute name="column-width">80%</xsl:attribute></xsl:element>
		<xsl:element name="fo:table-column"><xsl:attribute name="column-width">20%</xsl:attribute></xsl:element>
		<xsl:element name="fo:table-body" use-attribute-sets="text-normal">
			<xsl:attribute name="text-align">right</xsl:attribute>
			<xsl:element name="fo:table-row">
				<xsl:element name="fo:table-cell"><xsl:element name="fo:block">TOTAL (excluding GST) MYR ******</xsl:element></xsl:element>
				<xsl:element name="fo:table-cell"><xsl:element name="fo:block"><xsl:value-of select="Summary/TotalAmountExcludeTax"/></xsl:element></xsl:element>
			</xsl:element>
			<xsl:element name="fo:table-row">
				<xsl:element name="fo:table-cell"><xsl:element name="fo:block">GST TOTAL @ 6% MYR ******</xsl:element></xsl:element>
				<xsl:element name="fo:table-cell"><xsl:element name="fo:block"><xsl:value-of select="Summary/TotalTaxRate"/></xsl:element></xsl:element>
			</xsl:element>
			<xsl:element name="fo:table-row">
				<xsl:element name="fo:table-cell"><xsl:element name="fo:block">NETT TOTAL MYR ******</xsl:element></xsl:element>
				<xsl:element name="fo:table-cell"><xsl:element name="fo:block"><xsl:value-of select="Summary/Total"/></xsl:element></xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:element>
	<xsl:element name="fo:block" use-attribute-sets="text-normal"><xsl:value-of select="Summary/SIDescription"/></xsl:element>
 </xsl:template>
 
</xsl:stylesheet>