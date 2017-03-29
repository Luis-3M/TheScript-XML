<?xml version="1.0" encoding="UTF-8"?>
<!-- Luis Moreira up201102786@fc.up.pt -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" version="4.0"
		encoding="UTF-8" />
	<xsl:key name="IDtable" match="personagem" use="@identificador" />
	<xsl:key name="IDtable" match="refere" use="@personagem" />

	<xsl:template match="/">
		<!-- TODO: Auto-generated template -->
		<html>
			<body>
				<a href="../index.html">
					<h4
						style="font-style: italic; 
	text-decoration: underline; color: Black; display: inline-block">
						Voltar ao Menu
					</h4>
				</a>
				<!-- Listar/Navegar Elementos -->
				<ul style="font-family: courier;">
					<xsl:for-each select="guião/temporadas|guião/partes">
						<a name="#{Menu}" />
						<li style="margin: 10px;">
							<a href="#{@identificador}">
								<xsl:value-of select="título/text()" />
							</a>
							<ul>
								<xsl:for-each select="episódios">
									<li style="margin: 5px;">
										<a href="#{@identificador}">
											<xsl:value-of select="título/text()" />
										</a>
									</li>
								</xsl:for-each>
							</ul>
						</li>
					</xsl:for-each>
				</ul>
				<hr style="border: 0; border-bottom: 1px dashed #ccc; background: black;" />
				<xsl:apply-templates select="guião/cabeçalho" />
				<xsl:apply-templates select="guião/temporadas" />
				<xsl:apply-templates select="guião/partes" />
				<ol>
					<xsl:apply-templates select="guião/cenas" />
				</ol>
			</body>
		</html>
	</xsl:template>

	<!-- Cabeçalho -->
	<xsl:template match="guião/cabeçalho">
		<h1>
			<xsl:apply-templates select="título" />
		</h1>
		<xsl:apply-templates select="autor" />
		<xsl:apply-templates select="data" />
		<xsl:apply-templates select="sinopse" />
		<xsl:apply-templates select="personagens" />
	</xsl:template>

	<!-- Temporadas -->
	<xsl:template match="guião/temporadas">
		<h2>
			<a name="{@identificador}" />
			<xsl:apply-templates select="título" />
		</h2>
		<xsl:apply-templates select="sinopse" />
		<xsl:apply-templates select="personagens" />
		<xsl:for-each select="episódios">
			<h3>
				<a name="{@identificador}" />
				<xsl:apply-templates select="título" />
			</h3>
			<xsl:apply-templates select="sinopse" />
			<xsl:apply-templates select="personagens" />
			<ol>
				<xsl:for-each select="cenas">
					<li>
						<span
							style="font-family: arial; font-size: 13px; font-weight: bold; text-transform: uppercase;">
							<xsl:value-of select="@contexto" />
							<br />
						</span>
						<xsl:apply-templates />
					</li>
				</xsl:for-each>
			</ol>
			<br />
			<p style="font-style: oblique">
				<a href="#{Menu}">Topo</a>
			</p>
		</xsl:for-each>
	</xsl:template>

	<!-- Partes -->
	<xsl:template match="guião/partes">
		<h2>
			<a name="{@identificador}" />
			<xsl:apply-templates select="título" />
		</h2>
		<xsl:apply-templates select="sinopse" />
		<xsl:apply-templates select="personagens" />
		<ol>
			<xsl:for-each select="cenas">
				<li>
					<span
						style="font-family: arial; font-size: 13px; font-weight: bold; text-transform: uppercase;">
						<xsl:value-of select="@contexto" />
						<br />
					</span>
					<xsl:apply-templates />
				</li>
			</xsl:for-each>
		</ol>
		<p style="font-style: oblique">
			<a href="#{Menu}">Topo</a>
		</p>
	</xsl:template>

	<!-- Cenas -->
	<xsl:template match="guião/cenas">
		<xsl:for-each select=".">
			<li>
				<span
					style="font-family: arial; font-size: 13px; font-weight: bold; text-transform: uppercase;">
					<xsl:value-of select="@contexto" />
					<br />
				</span>
				<xsl:apply-templates />
			</li>
		</xsl:for-each>
		<p style="font-style: oblique">
			<a href="#{Menu}">Topo</a>
		</p>
	</xsl:template>

	<xsl:template match="título">
		<span style="color:black;">
			<xsl:value-of select="text()" />
		</span>
		<br />
	</xsl:template>

	<xsl:template match="autor">
		<span style="font-size: 16px; font-weight: bold; color: black;">Autor: </span>
		<span style="color:black;">
			<xsl:value-of select="text()" />
		</span>
		<br />
	</xsl:template>

	<xsl:template match="data">
		<span style="font-size: 16px; font-weight: bold; color: black;">Data: </span>
		<span style="color:black;">
			<xsl:value-of select="text()" />
		</span>
		<br />
	</xsl:template>

	<xsl:template match="sinopse">
		<span style="font-size: 16px; font-weight: bold; color: black;">Sinopse: </span>
		<span style="color:black;">
			<xsl:value-of select="text()" />
		</span>
		<br />
	</xsl:template>

	<xsl:template match="personagens">
		<span style="font-size: 16px; font-weight: bold; color: black;">Personagens: </span>
		<ul>
			<xsl:for-each select="personagem">
				<li>
					<span style="color:black;">
						<xsl:value-of select="nome/text()" />
					</span>
				</li>
				<ul>
					<li>
						<span style="color:black;">
							<xsl:value-of select="descrição/text()" />
						</span>
					</li>
				</ul>
			</xsl:for-each>
		</ul>
	</xsl:template>

	<xsl:template match="adereço">
		<span style="font-family: arial; font-weight: bold; font-size: 14px;">
			<xsl:value-of select="text()" />
		</span>
		<br />
	</xsl:template>

	<xsl:template match="fala">
		<xsl:choose>
			<xsl:when test="key('IDtable',@personagem)">
				<p style="color:black; margin-left: 11cm; text-transform: uppercase;">
					<xsl:value-of select="key('IDtable',@personagem)/nome" />
				</p>
			</xsl:when>
			<xsl:otherwise>
				<xsl:message terminate="no">
					Identificador Inválido!
				</xsl:message>
			</xsl:otherwise>
		</xsl:choose>
		<p style="color:black; margin-left: 7cm;">
			<xsl:value-of select="text()" />
		</p>
		<br />
	</xsl:template>

	<xsl:template match="comentário">
		(
		<i>
			<xsl:value-of select="text()" />
		</i>
		)
		<br />
	</xsl:template>

	<xsl:template match="refere">
		<p
			style="color:black; font-size: 14px; font-style: oblique; text-transform: uppercase;">
			<xsl:value-of select="key('IDtable',@personagem)/nome" />
		</p>
		<br />
	</xsl:template>
</xsl:stylesheet>