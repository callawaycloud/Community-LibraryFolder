# Library Folder

A simple component that is used in Experience Cloud to view a specific Library folder.
This component could be dropped anywhere in a Salesforce community to show files pertaining to a specific library folder.

![Imgur](https://i.imgur.com/dKwTQrs.png)

## 📦 Install

**via sfdx-cli**
`sfdx force:package:install --package 0Ho5e00000000deCAA -u your@org.user`

**via url**
login and navigate to [`/packaging/installPackage.apexp?p0=0Ho5e00000000deCAA`](https://login.salesforce.com/packaging/installPackage.apexp?p0=0Ho5e00000000deCAA). Choose `Install for: Admin Only`.

## 🔨 Usage

1. Add the clas ``CommunityLibraryFolderController`` to the profile/permission set being used in the community
2. Go to your community in Experience cloud
3. Go to any page and drag the component ``Library Folder`` onto the page
4. For the component's parameters, specify the name of the Library Folder that has the files you want to display

## ✨Features

### Display a specific library folder anywhere in a community

- This component gives you the ability to display the files of a targeted library folder
- No more having to display the entire library for the user to browse through

### Download on click

- When you click on the title of the file, the file will be automatically downloaded

### Sorting

- Community users have the ability to sort the title and last modified columns by default


** Powered by ** [Callaway Cloud Consulting](https://www.callawaycloud.com/)