<?xml version="1.0" encoding="SHIFT_JIS"?>
<!--
  kotobun_written.xsl
  Written by Sae UENO, Miwa FUJIMOTO, Masaya YAMAGUCHI, 2007-04-23
  Copyright 2007 The National Institute for Japanese Language
  This script is distributed under GNU Public License.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- �\���p -->

  <xsl:template match="�L��">
    <html xmlns:xhtml="http://www.w3.org/1999/xhtml">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=shift_jis"/>
        <meta http-equiv="Content-Style-Type" content="text/css" />
        <link rel="stylesheet" href="jck.css" type="text/css" />
	<title>
		<xsl:value-of select="@�^�C�g��"/>
		<xsl:text>�F</xsl:text>
		<xsl:value-of select="@����"/>
	</title>
      </head>

      <body>
        <h1>
          <xsl:value-of select="@�^�C�g��" />
          <xsl:text>�F</xsl:text>
          <xsl:value-of select="@����" />
        </h1>
        <h2>
          <xsl:value-of select="@��{" />
        </h2>
        <xsl:apply-templates/>
	<!-- reffer to http://www.feedthebot.com/pagespeed/defer-loading-javascript.html -->
	<script type="text/javascript">
          function jumpToAnchor () {
	      var c = 0;
	      
	      var tid = setInterval(function(){
		  if(document.getElementById("himawari") != null){
		      clearInterval(tid);
		      location.href="#himawari";
		  } else{
		      c++;
		      if(c > 10){
			  clearInterval(tid);
		      }
		  }
	      }, 100);
	  }

          if (window.addEventListener){
	      window.addEventListener("load", jumpToAnchor, false);
	  } else if (window.attachEvent) {
	      window.attachEvent("onload", jumpToAnchor);
	  } else {
	      window.onload = jumpToAnchor;
	  }
	</script>
      </body>
    </html>
</xsl:template>

<xsl:template match="�K�w">
  <xsl:choose>
    <xsl:when test="@���='h1'">
      <hr style="border-style:solid; background-color:lemonchiffon; border:none; height:10px;"/>
      <xsl:apply-templates/>
      <br/><hr style="border-style:solid; background-color:lemonchiffon; border:none; height:10px;"/>
    </xsl:when>
    <xsl:when test="@���='h2'">
      <xsl:apply-templates/>
      <br/><hr style="border-style:solid; background-color:lemonchiffon; border:none; height:5px;"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates/><br/><hr style="border-style:solid; background-color:lemonchiffon; border:none; height:3px;"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="���p">
	<xsl:choose>
		<xsl:when test="@���='�a��'">
			<span title="{@���}�F{@���p��}" style="background-color:mistyrose; cursor:pointer; "><em><xsl:apply-templates/></em></span>
		</xsl:when>
		<xsl:otherwise>
		<span title="{@���}�F{@���p��}" style="background-color:mistyrose; cursor:pointer;"><xsl:apply-templates/></span>
		</xsl:otherwise>
	</xsl:choose>
  </xsl:template>

  <xsl:template match="�^�C�g��">
    <h3><xsl:apply-templates/></h3>
  </xsl:template>

  <xsl:template match="����">
    <b><xsl:apply-templates/></b>
  </xsl:template>


  <xsl:template match="�b��">
    <xsl:text>�@</xsl:text>
    <em><xsl:apply-templates/></em>
    <xsl:text>�@</xsl:text>
  </xsl:template>

  <xsl:template match="�u���b�N">
    <xsl:choose>
      <xsl:when test="@���='�g����'">
    <span style="font-size: x-small; "><xsl:apply-templates/></span>
      </xsl:when>
      <xsl:when test="@���='����'">
    <span title="����"><xsl:apply-templates/></span><br />
      </xsl:when>
      <xsl:when test="@���='����'">
    <span title="����"><xsl:apply-templates/></span>
      </xsl:when>

      <xsl:when test="@���='������'">
    <span title="{@���}" style="cursor: pointer"><p style="padding-left:2em;"><xsl:apply-templates/></p></span>
      </xsl:when>
      <xsl:when test="@���='�Ԃ牺��'">
    <span title="{@���}" style="cursor: pointer" ><p style="padding:0px 0px 0px 2em; "><xsl:apply-templates/></p></span>
      </xsl:when>
      <xsl:when test="@���='�n�t��'">
    <span title="{@���}" style="cursor: pointer"><p style="text-align:right; margin-right:2em"><xsl:apply-templates/></p></span>
      </xsl:when>


      <xsl:otherwise>
    <br /><span style="border-style:solid; border-width:thin; border-color:gainsboro; display:block; "><xsl:apply-templates/></span><br />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="����">
    <xsl:choose>
      <xsl:when test="span">
        <xsl:apply-templates/>
      </xsl:when>
    <xsl:otherwise>
    <sub><xsl:apply-templates/></sub>
    </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="span">
    <xsl:choose>
      <xsl:when test="@���='�T�_'">
        <span title="{@���}{@���l}" style="cursor:pointer; background-color:azure;"><xsl:apply-templates/></span>
      </xsl:when>

      <xsl:when test="@���='�T��'">
        <span title="�T��" style="cursor:pointer; text-decoration:underline"><xsl:apply-templates/></span>
      </xsl:when>

      <xsl:when test="@���l='��t��'">
        <span title="{@���l}" style="cursor:pointer; background-color:azure;"><sup><xsl:apply-templates/></sup></span>
      </xsl:when>

      <xsl:when test="@���l='���t��'">
        <span title="{@���l}" style="cursor:pointer; background-color:azure;"><sub><xsl:apply-templates/></sub></span>
      </xsl:when>

      <xsl:when test="@���='��'">
        <xsl:text>�@</xsl:text>
      </xsl:when>

      <xsl:otherwise>
        <span title="{@���}" style="cursor:pointer;"><strong><xsl:apply-templates/></strong></span>
      </xsl:otherwise>

    </xsl:choose>
  </xsl:template>

  <xsl:template match="�w�b�_">
    <span style="color:lightsteelblue">
      <xsl:apply-templates/>
    </span>
    <hr/>
  </xsl:template>

  <xsl:template match="�t�b�^">
    <span style="color:lightsteelblue">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="��">
    <xsl:choose>
      <xsl:when test="@���='�}�}'">
    <xsl:apply-templates />
    <sup style="color:red">
        <xsl:text>�i�}�}�j</xsl:text>
    </sup>
      </xsl:when>


      <xsl:when test="@�t�^='����'">
         <span title="{@���}�F{@�t�^}" style="font-size: x-small; cursor:pointer;"><xsl:apply-templates /></span>
      </xsl:when>

      <xsl:when test="@���e">
         <span title="{@���}�F{@�t�^}�F{@���l}" style="font-size: x-small; color: mediumseagreen; cursor:pointer;"><xsl:value-of select="@���e" /></span>
      </xsl:when>

      <xsl:when test="@���l">
        <xsl:call-template name="notes"/>
      </xsl:when>

      <xsl:otherwise>
      <span title="{@���}�F{@�t�^}" style="cursor:pointer; color:lightsteelblue;"><xsl:apply-templates /></span>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


<xsl:template name="notes">
<xsl:choose>
  <xsl:when test="@���l=contains(@���l,'�T�L')">
         <br /><span title="{@���}�F{@�t�^}�F{@���l}" style="font-size: small; cursor:pointer;"><xsl:apply-templates /></span>
  </xsl:when>
  <xsl:otherwise>
         <span title="{@���}�F{@�t�^}�F{@���l}" style="font-size: small; cursor:pointer;"><xsl:apply-templates /></span>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>


  <xsl:template match="����">
    <xsl:apply-templates/>
      <sup title="{@���}" style="color:red;cursor:pointer">��</sup>
  </xsl:template>

  <xsl:template match="r">
    <ruby>
        <rb><xsl:apply-templates/></rb>
	<rp><xsl:text>(</xsl:text></rp>
        <rt><xsl:value-of select="@rt"/></rt>
	<rp><xsl:text>)</xsl:text></rp>
    </ruby>
  <xsl:if test="@lrt">
        <span style="color:indigo">
        <xsl:text>�i</xsl:text>
        <xsl:value-of select="@lrt"/>
        <xsl:text>�j</xsl:text>
        </span>
  </xsl:if>
  </xsl:template>

<xsl:template match="����">
    <span style="font-size: x-small;">�m<xsl:apply-templates/>�n</span>
</xsl:template>
<xsl:template match="�������s">
<span class="gray">�^</span>
</xsl:template>

  <xsl:template match="�摜">
  <xsl:choose>
    <xsl:when test="@���l='gaiji'">
    <img>
      <xsl:attribute name="src"><xsl:value-of select="@src" /></xsl:attribute>
      <xsl:attribute name="alt"><xsl:value-of select="@alt" /></xsl:attribute>
  <xsl:if test="@height">
      <xsl:attribute name="height"><xsl:value-of select="@height" /></xsl:attribute>
  </xsl:if>
  <xsl:if test="@width">
      <xsl:attribute name="width"><xsl:value-of select="@width" /></xsl:attribute>
  </xsl:if>
   </img>
  </xsl:when>
  <xsl:otherwise>
    <br/><img>
      <xsl:attribute name="src"><xsl:value-of select="@src" /></xsl:attribute>
      <xsl:attribute name="alt"><xsl:value-of select="@alt" /></xsl:attribute>
  <xsl:if test="@height">
      <xsl:attribute name="height"><xsl:value-of select="@height" /></xsl:attribute>
  </xsl:if>
  <xsl:if test="@width">
      <xsl:attribute name="width"><xsl:value-of select="@width" /></xsl:attribute>
  </xsl:if>
   </img><br />
    </xsl:otherwise>
  </xsl:choose>
  </xsl:template>

  <xsl:template match="������_">�@��</xsl:template>

  <xsl:template match="�O��">
    <span title="{@���l}" style="cursor:pointer"><xsl:apply-templates/></span>
  </xsl:template>

  <xsl:template match="��">
    <span style="color:darkred">�m<xsl:value-of select="@���e"/>�n</span>
  </xsl:template>

  <xsl:template match="��"><p style="color:silver">(p.<xsl:value-of select="@no"/>)</p>
  </xsl:template>

  <xsl:template match="�s">
  <xsl:choose>
    <xsl:when test="@no">
    <span style="color:silver; text-align:right" >(<xsl:value-of select="@no"/>)</span><br />
    </xsl:when>
    <xsl:otherwise>
      <br />
    </xsl:otherwise>
  </xsl:choose>
  </xsl:template>

  <xsl:template match="b"><br/></xsl:template>

<!-- nijl�ǉ� -->

<xsl:template match="����">
    <span title="����"><xsl:apply-templates/></span><br />
</xsl:template>

<xsl:template match="����">
    <br /><span title="����"><xsl:apply-templates/></span>
</xsl:template>

<xsl:template match="�Z�N�V����">
    <xsl:apply-templates/>
    <p style="color:silver; text-align: center; "><xsl:text>No.</xsl:text><xsl:value-of select="@id"/></p><br />
</xsl:template>

<xsl:template match="sp">
  <xsl:apply-templates/>
</xsl:template>


<!-- for diy.htd -->
<xsl:template match="t1">
  <h3><xsl:text>t1:</xsl:text><xsl:value-of select="@arg1"/>/<xsl:value-of select="@arg2"/>/<xsl:value-of select="@arg3"/></h3>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="t2">
  <h3><xsl:text>t2:</xsl:text><xsl:value-of select="@arg1"/>/<xsl:value-of select="@arg2"/>/<xsl:value-of select="@arg3"/></h3>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="e1">
  <strong><xsl:text>[[</xsl:text><xsl:value-of select="@arg1"/>/<xsl:value-of select="@arg2"/>/<xsl:value-of select="@arg3"/><xsl:text>]]</xsl:text></strong>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="e2">
  <strong><xsl:text>((</xsl:text><xsl:value-of select="@arg1"/>/<xsl:value-of select="@arg2"/>/<xsl:value-of select="@arg3"/><xsl:text>))</xsl:text></strong>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="u1">
  <span title="u1:{@arg1},{@arg2},{@arg3}" style="text-decoration:underline">
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="u2">
  <strong title="u2:{@arg1},{@arg2},{@arg3}">
    <xsl:apply-templates/>
  </strong>
</xsl:template>

  <xsl:template match="tg">
    <span class="target_char">
      <xsl:attribute name="id">
        <xsl:value-of select="@id"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="br">
    <br />
  </xsl:template>
  <xsl:template match="cr">
    <ruby class="correction">
      <xsl:attribute name="title">
        <xsl:value-of select="@org"/>
      </xsl:attribute>
      <rb><xsl:apply-templates/></rb>
      <rp><xsl:text>(</xsl:text></rp>
      <rt><xsl:value-of select="@org"/></rt>
      <rp><xsl:text>)</xsl:text></rp>
    </ruby>
  </xsl:template>
</xsl:stylesheet>
