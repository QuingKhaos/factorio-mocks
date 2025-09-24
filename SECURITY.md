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

- **Acknowledgment**: Within 72 hours
- **Initial Assessment**: Within 7 days
- **Resolution**: Varies based on complexity and severity

## Security Considerations

The Factorio Mocks Ecosystem is a collection of tools for generating and consuming mock data for Factorio mod testing.

### Ecosystem Components

- **Documentation Hub** (`factorio-mocks`) - Planning documents and community coordination
- **Data Generator** (`factorio-mocks-generator`) - Extracts data from Factorio installations
- **Mock Data** (`factorio-mocks-data`) - Stores generated mock data artifacts
- **Data Loader** (`factorio-mocks-loader`) - Library for consuming mock data in tests

### Security Practices

- **Data Integrity**: Generated data validated before publication
- **Clean Artifacts**: Mock data contains only Factorio game data
- **Sandboxed Execution**: Data extraction runs within Factorio's environment

## For Contributors

- **Documentation**: Keep security considerations updated with project changes
- **Dependencies**: Report any dependency vulnerabilities discovered
- **Access Control**: Use GitHub's web interface for PR creation to apply templates

## Security Features

- **GitHub Security**: Private vulnerability reporting and secret scanning enabled
- **Branch Protection**: All changes require PR review and status checks
- **Dependabot**: Automated monitoring for GitHub Actions dependencies
- **Manual Review**: Primary security control for all ecosystem changes
- **Issue Tracking**: Centralized in main repository for visibility
- **Documentation First**: Security considerations documented before implementation
- **Gradual Rollout**: Phase-based development reduces risk surface
- **Community Feedback**: Open discussions for security-related design decisions

## Security Contacts

For security-related questions or concerns:

- **GitHub Security**: Use private vulnerability reporting in [this repository](https://github.com/QuingKhaos/factorio-mocks/security/advisories)
- **Community**: General security discussions in [GitHub Discussions](https://github.com/QuingKhaos/factorio-mocks/discussions)

---

*This security policy reflects the current Phase 1 implementation of the Factorio Mocks Ecosystem.*
