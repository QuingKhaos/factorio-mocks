# Security Policy

## Supported Versions

This project is currently in early development phase. Security updates will be provided for:

| Version | Supported          |
| ------- | ------------------ |
| main    | :white_check_mark: |

## Reporting a Vulnerability

We take security vulnerabilities seriously. If you discover a security vulnerability, please report it by:

1. **DO NOT** open a public issue
2. Use GitHub's private vulnerability reporting feature

### What to Include

Please include as much information as possible:

- Description of the vulnerability
- Steps to reproduce the issue
- Potential impact and affected components
- Suggested fix (if any)
- Your contact information for follow-up

### Response Timeline

- **Acknowledgment**: Within 48 hours
- **Initial Assessment**: Within 7 days
- **Status Updates**: Weekly until resolved
- **Resolution**: Varies based on complexity and severity

## Security Considerations

This ecosystem involves several security-sensitive areas:

### Data Extraction (`factorio-mocks-generator`)

- Executes within Factorio game environment
- Accesses and serializes game data
- Potential for data leakage or corruption

### Artifact Distribution (`factorio-mocks-modpacks`)

- Container registry interactions
- Artifact integrity and authenticity
- Supply chain security

### Code Execution (`factorio-mocks-loader`)

- Lua code execution in testing environments
- Potential for code injection or malicious payloads
- Sandbox escape vulnerabilities

### CI/CD Pipeline

- GitHub Actions workflow security
- Secret management and access controls
- Dependency chain vulnerabilities

## Best Practices for Contributors

### When Contributing Code

- Follow secure coding practices (especially important for Lua without automated SAST)
- Validate all inputs and sanitize outputs
- Use principle of least privilege
- Avoid hardcoded secrets or credentials
- Test security implications of changes
- Be extra vigilant with file I/O and external data processing
- Consider Lua-specific security risks (sandbox escapes, code injection)

### When Reporting Issues

- Be responsible in disclosure timing
- Provide clear reproduction steps
- Consider impact on community before public disclosure
- Follow coordinated disclosure principles

## Security Features

### Current Security Measures

- **Dependabot**: Automated dependency vulnerability scanning (GitHub Actions only)
- **Secret Scanning**: Prevents accidental credential commits
- **Branch Protection**: Requires review for all changes
- **Signed Commits**: Ensures commit authenticity on main branch
- **CI/CD Security**: Minimal required permissions
- **Manual Code Review**: Primary security control for Lua code

### Planned Security Enhancements

- **Lua Security Guidelines**: Documented secure coding standards for contributors
- **Manual Dependency Monitoring**: Regular security assessments of LuaRocks packages
- **SBOM Generation**: Software Bill of Materials for releases
- **Security Audits**: Regular third-party security reviews focused on Lua-specific risks
- **Threat Modeling**: Formal threat analysis of ecosystem components
- **Input Validation Standards**: Comprehensive data validation and sanitization practices

## Security Contacts

For security-related questions or concerns:

- **GitHub Security**: Use private vulnerability reporting
- **Community**: Security discussions in GitHub Discussions (for general questions only)

## Acknowledgments

We appreciate the security research community and will acknowledge contributors who help improve the security of this
project (with their permission).

---

*This security policy is reviewed and updated regularly to reflect the current state of the project and emerging security
best practices.*
