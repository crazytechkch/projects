<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<style>
					body {font-family:sans-serif;font-size:10pt}
					thead {display:table-header-group;}
					tbody {display:table-row-group;}
					tfoot {display:table-footer-group;}
					table {border-collapse:collapse;}
					.orgnName {font-size:14pt;font-weight:bold;}
					.orgnGroup {font-size:11pt;font-weight:bold}
					.colheader td{border:1px;border-style:solid none solid none;padding:2px;}
					.datarow td{padding:2px;vertical-align:top}
					.summaryrow td{text-align:right}
					.gsttable td{font-size:8pt;padding:2px}
					.signtable td{padding:5px;border:1px solid black}
					.nametable {width:100%}
					.nametable td{border:none;padding:0px}
				</style>
			</head>
			<body>
				<xsl:apply-templates select="Documents/Document"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Document">
		<table style="width:100%">
			<thead id="header">
				<tr><td colspan="100%">
					<div>
						<span class="orgnName"><xsl:value-of select="Header/OrganisationName"/></span>&#160;<xsl:value-of select="Header/OrganisationRegNo"/>&#160;<xsl:value-of select="Header/GstRegNo"/>
					</div>
					<div class="orgnGroup"><xsl:value-of select="Header/OrganisationGroup"/></div>
					<div>
						<xsl:value-of select="Header/OrganisationAddress"/><br/>
						Tel: <xsl:value-of select="Header/OrganisationPhoneNo"/> Fax: <xsl:value-of select="Header/OrganisationFaxNo"/>
					</div>
					<br/>
					<div>
						<div style="float:left">
							<xsl:value-of select="Header/AccountName"/><br/>
							<xsl:value-of select="Header/ClientMailAddr1"/><br/>
							<xsl:value-of select="Header/ClientMailAddr2"/><br/>
							<xsl:value-of select="Header/ClientMailAddr3"/><br/>
							<xsl:value-of select="Header/ClientMailPostcode"/><br/>
							Tel: <xsl:value-of select="Header/ClientContactNo"/><br/>
							Attn: <xsl:value-of select="Header/ClentContactPerson"/>
						</div>
						<div style="float:right">
							<table>
								<tr><td>Number</td><td>:<xsl:value-of select="Header/SINo"/></td></tr>
								<tr><td>Date</td><td>:<xsl:value-of select="Header/SIDate"/></td></tr>
								<tr><td>Reference No.</td><td>:<xsl:value-of select="Header/ClientSupplierReference"/></td></tr>
								<tr><td>Page No.</td><td>:<xsl:value-of select="Header/PageNo"/></td></tr>
								<tr><td>No. of Print</td><td>:<xsl:value-of select="Header/PrintSequence"/></td></tr>
							</table>
						</div>
					</div>
				</td></tr>
				<tr><th colspan="100%"><u>TAX INVOICE</u></th></tr>
				<tr class="colheader">
					<td>No.</td><td>D.O. No.<br/>Your Ref.</td><td>Packing List</td><td>Description<br/>Part No/Item Code</td><td align="right">Qty</td><td>UOM</td><td align="right">Unit Price<br/>(<xsl:value-of select="Header/CurrencyCode"/>)</td><td align="right">Amount<br/>(<xsl:value-of select="Header/CurrencyCode"/>)</td>
				</tr>
				
			</thead>
			<tbody>
				<xsl:apply-templates select="Details/Detail"/>
			</tbody>
			<tfoot>
				<xsl:apply-templates select="Summarys/Summary"/>
				<xsl:apply-templates select="Summarys/GSTSummary"/>
				<tr><td colspan="100%">
					<div>
						<br/><br/>
						This is a computer generated document. No signature required.
						<br/><br/>
						<table class="signtable">
							<tr>
								<td>
									<div>
										TRANSPORTER acknowledgement - Stamp &amp; Sign<br/><br/>
										Goods Collected by:<br/><br/><br/>
										<table class="nametable">
											<tr><td>Name</td><td style="width:35%">:</td><td>IC No.</td><td style="width:35%">:</td></tr>
											<tr><td>Date</td><td>:</td></tr>
										</table>
									</div>
								</td>
								<td>
									<div>
										CUSTOMER acknowledgement - Stamp &amp; Sign<br/><br/>
										Goods Received by:<br/><br/><br/>
										<table class="nametable">
											<tr><td>Name</td><td style="width:35%">:</td><td>IC No.</td><td style="width:35%">:</td></tr>
											<tr><td>Date</td><td>:</td></tr>
										</table>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</td></tr>
				<tr><td colspan="100%" style="text-align:right"><xsl:value-of select="../Footer/AccountNo"/></td></tr>
			</tfoot>
		</table>
	
	</xsl:template>
	<xsl:template match="Detail">
		<tr class="datarow">
			<td><xsl:number/></td>
			<td><xsl:value-of select="SIDOReference"/><br/><xsl:value-of select="SIClientSupplierSOReference"/></td>
			<td><xsl:value-of select="ItemList"/></td>
			<td><xsl:value-of select="ItemDescription"/><br/><xsl:value-of select="ItemCode"/></td>
			<td align="right"><xsl:value-of select="ItemQuantity"/></td>
			<td><xsl:value-of select="ItemUOM"/></td>
			<td align="right"><xsl:value-of select="ItemPrice"/></td>
			<td align="right"><xsl:value-of select="ItemAmount"/></td>
		</tr>
	</xsl:template>
	<xsl:template match="Summary">
		<tr class="summaryrow"><td colspan="7">TOTAL (excluding GST) <xsl:if test="TotalAmountExcludeTax != ''"><xsl:value-of select="//Header/CurrencyCode"/></xsl:if> ******</td><td><xsl:value-of select="TotalAmountExcludeTax"/></td></tr>
		<tr class="summaryrow"><td colspan="7">GST TOTAL @ 6% <xsl:if test="TotalTaxRate != ''"><xsl:value-of select="//Header/CurrencyCode"/></xsl:if> ******</td><td><xsl:value-of select="TotalTaxRate"/></td></tr>
		<tr class="summaryrow"><td colspan="7">NETT TOTAL <xsl:if test="Total != ''"><xsl:value-of select="//Header/CurrencyCode"/></xsl:if> ******</td><td><xsl:value-of select="Total"/></td></tr>
		<tr><td colspan="6"><br/><br/><xsl:value-of select="SIDescription"/></td></tr>
	</xsl:template>
	<xsl:template match="GSTSummary">
		<tr><td colspan="100%"><div>
			<table class="gsttable">
				<tr><td>GST Summary</td><td>Item</td><td>Amount(<xsl:value-of select="//Header/CurrencyCode"/>)</td><td>Tax(<xsl:value-of select="//Header/CurrencyCode"/>)</td></tr>
				<tr>
					<td><xsl:value-of select="DefaultTaxRate"/></td>
					<td><xsl:value-of select="ItemCount"/></td>
					<td><xsl:value-of select="Amount"/></td>
					<td><xsl:value-of select="TaxRate"/></td>
				</tr>
			</table>
		</div></td></tr>
	</xsl:template>
</xsl:stylesheet>