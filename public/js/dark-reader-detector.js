// 检测Dark Reader注入
function detectDarkReader() {
  if (document.documentElement.hasAttribute('data-darkreader-mode')) {
    console.warn('Dark Reader已注入此网站');
    
    // 创建警告提示
    const warning = document.createElement('div');
    warning.style.position = 'fixed';
    warning.style.bottom = '20px';
    warning.style.right = '20px';
    warning.style.padding = '10px 15px';
    warning.style.backgroundColor = '#ff9800';
    warning.style.color = 'white';
    warning.style.borderRadius = '4px';
    warning.style.zIndex = '9999';
    warning.textContent = '呜喵>_< 被Dark Reader狠狠地注♂入了！！！会坏掉的！主人还是把它关掉吧喵……';
    
    document.body.appendChild(warning);
    
    // 5秒后自动移除警告
    setTimeout(() => {
      warning.remove();
    }, 5000);
  }
}

document.addEventListener('DOMContentLoaded', detectDarkReader);
