const docs = {
	navigation: [
		{
			id: 'started',
			title: 'Getting Started',
			file: 'docs/getting-started.md'
		},
		{
			id: 'installation',
			title: 'Installation',
			file: 'docs/installation.md',
			children: [
				{
					id: 'installation-prerequisites',
					title: 'Prerequisites',
					section: 'prerequisites'
				},
				{
					id: 'installation-quick-start',
					title: 'Quick Start',
					section: 'quick-start'
				}
			]
		},
		{
			id: 'configuration',
			title: 'Configuration',
			file: 'docs/configuration.md',
			children: [
				{
					id: 'config-basic',
					title: 'Basic Configuration',
					section: 'basic-configuration'
				},
				{
					id: 'config-advanced',
					title: 'Advanced Configuration',
					section: 'advanced-configuration'
				}
			]
		}
	]
};

// Initialize the documentation site
function initDocs() {
    createNavigation();
    loadContent(window.location.hash || '#getting-started');

    // Handle navigation
    window.addEventListener('hashchange', () => {
        loadContent(window.location.hash);
    });
}

// Create navigation menu with nested items
function createNavigation() {
    const navMenu = document.getElementById('nav-menu');
    docs.navigation.forEach(item => {
        const navItem = createNavItem(item, true);
        navMenu.appendChild(navItem);
    });
}

// Create a navigation item and its children
function createNavItem(item, isRoot = true) {
    const container = document.createElement('div');
    container.className = `nav-item${isRoot ? ' root-item' : ''}`;

    const link = document.createElement('a');
    // If it's a child item, link to parent's file with section hash
    if (item.section) {
        const parentHash = window.location.hash.split('#')[1]?.split('-')[0] || 'getting-started';
        link.href = `#${parentHash}-${item.section}`;
    } else {
        link.href = `#${item.id}`;
    }
    link.textContent = item.title;
    container.appendChild(link);

    if (item.children && item.children.length > 0) {
        const childContainer = document.createElement('div');
        childContainer.className = 'nav-children';
        
        const toggleBtn = document.createElement('button');
        toggleBtn.className = 'toggle-btn';
        toggleBtn.innerHTML = '▼';
        toggleBtn.onclick = (e) => {
            e.preventDefault();
            childContainer.classList.toggle('expanded');
            toggleBtn.innerHTML = childContainer.classList.contains('expanded') ? '▼' : '▶';
        };
        
        link.parentNode.insertBefore(toggleBtn, link.nextSibling);

        item.children.forEach(child => {
            const childItem = createNavItem(child, false);
            childContainer.appendChild(childItem);
        });
        
        container.appendChild(childContainer);
    }

    return container;
}

// Find navigation item by ID (including nested items)
function findNavItem(id, items = docs.navigation) {
    for (const item of items) {
        if (item.id === id) return item;
        if (item.children) {
            const found = findNavItem(id, item.children);
            if (found) return found;
        }
    }
    return null;
}

// Load content from markdown files and scroll to section if specified
async function loadContent(hash) {
    // Parse the hash to get both file ID and section
    const [fileId, section] = hash.replace('#', '').split('-');
    
    // Handle empty hash or root path
    if (!fileId) {
        const defaultItem = docs.navigation[0];  // getting-started
        window.location.hash = `#${defaultItem.id}`;
        return;
    }
    
    let navItem = findNavItem(fileId);
    
    // If we didn't find the item directly, it might be a section reference
    if (!navItem) {
        const parentId = fileId.split('-')[0];
        navItem = findNavItem(parentId);
    }
    
    // If still no item found, default to first item
    if (!navItem || !navItem.file) {
        const defaultItem = docs.navigation[0];  // getting-started
        window.location.hash = `#${defaultItem.id}`;
        return;
    }

    try {
        const response = await fetch(navItem.file);
        const markdown = await response.text();
        const contentArea = document.getElementById('content-area');
        contentArea.innerHTML = marked.parse(markdown);

        // Update active navigation item
        document.querySelectorAll('#nav-menu a').forEach(link => {
            link.classList.remove('active');
        });
        
        // Find and activate the correct link
        const activeLink = document.querySelector(`a[href="${hash}"]`);
        if (activeLink) {
            // Remove active class from all other items
            document.querySelectorAll('#nav-menu a').forEach(link => {
                if (link !== activeLink) {
                    link.classList.remove('active');
                }
            });
            
            // Add active class to the clicked item
            activeLink.classList.add('active');
            
            // If it's a nested item, make sure its parent menu is expanded
            const parentNavChildren = activeLink.closest('.nav-children');
            if (parentNavChildren) {
                parentNavChildren.classList.add('expanded');
                const toggleBtn = parentNavChildren.previousElementSibling.querySelector('.toggle-btn');
                if (toggleBtn) {
                    toggleBtn.innerHTML = '▼';
                }
            }
        }

        // If there's a section specified, scroll to it
        if (section) {
            const sectionElement = document.getElementById(section);
            if (sectionElement) {
                sectionElement.scrollIntoView({ behavior: 'smooth' });
            }
        }

        // Update document title
        document.title = `${navItem.title} - Documentation`;
    } catch (error) {
        console.error('Error loading content:', error);
    }
}

// Initialize when the page loads
document.addEventListener('DOMContentLoaded', initDocs);
