import xml.etree.ElementTree as ET
import csv
import logging

#tree = ET.parse("testxmlfile.xml")
tree = ET.parse('python\metatest3.xml')
root = tree.getroot()
#root = ET.fromstring(tree)
logging.basicConfig(filename='python\metatest.log',level=logging.DEBUG)

# open a file for writing

metadata_data = open('python\metatest.csv', 'w')

# create the csv writer object

csvwriter = csv.writer(metadata_data)

metadata_head = []
customer = []
poc_list = []

count = 0
blank = ""

#for member in root.iter():
for member in root.iter('{urn:oasis:names:tc:SAML:2.0:metadata}EntityDescriptor'):
#for member in root.find('{urn:oasis:names:tc:SAML:2.0:metadata}EntityDescriptor'):
#for member in root.findall('{urn:oasis:names:tc:SAML:2.0:metadata}ContactPerson'):
#for member in root:

#   testEmnt = member.find("ContactPerson")
#   testEmnt = member.find('{urn:oasis:names:tc:SAML:2.0:metadata}Company')
#   testEmnt1 = member.findall('{urn:oasis:names:tc:SAML:2.0:metadata}EntityDescriptor')
#   testEmnt2 = member.attrib.find('entityID')
#   testEmnt2 = member.get('contactType')
#   print(member.find('{urn:oasis:names:tc:SAML:2.0:metadata}SPSSODescriptor'))
#   print(root, root.tag, root.attrib)
#   print(root.tag, root.attrib)
#   print(root.attrib)
#   print(member.tag, member.attrib)
#   print(member.find('entityID'))
#   print(member, member.tag, member.attrib)
#   print(member.tag, member.attrib)
#   print(member.attrib)
#   print(member.tag)
#   print(member)
#   print(member[0][0].text)
#   print(member('entityID').text)
#   print(testEmnt('entityID').text)
#   print(testEmnt.tag)
#   print(testEmnt1)
#   print(testEmnt2)

   if count == 0:
      entityid = "entityID"
      metadata_head.append(entityid)
      realm = "realm"
      metadata_head.append(realm)
      appurl = "URL"
      metadata_head.append(appurl)
      loffice = "LO"
      metadata_head.append(loffice)
      techpoc = "Technical POC"
      metadata_head.append(techpoc)
      fedpoc = "Federal POC"
      metadata_head.append(fedpoc)
      sopoc = "SO"
      metadata_head.append(sopoc)
      specattrs = "Special Attributes"
      metadata_head.append(specattrs)
      shark = "Shark Issue"
      metadata_head.append(shark)
      lmdata = "Latest Metadata"
      metadata_head.append(lmdata)

      csvwriter.writerow(metadata_head)
      count = count + 1

      eid = member.get('entityID')
      customer.append(eid)
      trealm = ""
      customer.append(trealm)
#     EmailAddress = member.find('EmailAddress').tag
#     metadata_head.append(EmailAddress)
#     Address = member[3].tag
#     metadata_head.append(Address)

#  print(eid)
#  print

for member in root.iter('{urn:oasis:names:tc:SAML:2.0:metadata}Organization'):

   organizan = member.find('{urn:oasis:names:tc:SAML:2.0:metadata}OrganizationName').text
   organizad = member.find('{urn:oasis:names:tc:SAML:2.0:metadata}OrganizationDisplayName').text
   organizau = member.find('{urn:oasis:names:tc:SAML:2.0:metadata}OrganizationURL').text
   customer.append(organizau)
   customer.append(organizad)


#   print(organizan)
#   print(organizad)
#   print(organizau)
#   print
   
for member in root.iter('{urn:oasis:names:tc:SAML:2.0:metadata}ContactPerson'):

   contactpt  = member.get('contactType')
   print(contactpt)
   contactpn = member.find('{urn:oasis:names:tc:SAML:2.0:metadata}GivenName').text
   contactps = member.find('{urn:oasis:names:tc:SAML:2.0:metadata}SurName').text
   contactpe = member.find('{urn:oasis:names:tc:SAML:2.0:metadata}EmailAddress').text
   contactpp = member.find('{urn:oasis:names:tc:SAML:2.0:metadata}TelephoneNumber').text

   if "technical" in contactpt:
      customer.append(contactpe)
      customer.append(blank)
      customer.append(blank)

   if "support" in contactpt:
      customer.append(blank)
      customer.append(contactpe)
      customer.append(blank)

   if "administrative" in contactpt:
      customer.append(blank)
      customer.append(blank)
      customer.append(contactpe)

#   print(contactpn)
#   print(contactps)
#   print(contactpe)
#   print(contactpp)
#   print(member.tag, member.text)

#   PhoneNumber = member.find('PhoneNumber').text
#   resident.append(PhoneNumber)
#   EmailAddress = member.find('EmailAddress').text
#   resident.append(EmailAddress)
#   Address = member[3][0].text
#   address_list.append(Address)
#   City = member[3][1].text
#   address_list.append(City)
#   StateCode = member[3][2].text
#   address_list.append(StateCode)
#   PostalCode = member[3][3].text
#   address_list.append(PostalCode)
#   resident.append(address_list)

   csvwriter.writerow(customer)

metadata_data.close()
