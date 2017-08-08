// Code generated by protoc-gen-gogo.
// source: kythe/proto/java.proto
// DO NOT EDIT!

/*
	Package java_proto is a generated protocol buffer package.

	It is generated from these files:
		kythe/proto/java.proto

	It has these top-level messages:
		JavaDetails
*/
package java_proto

import proto "github.com/golang/protobuf/proto"
import fmt "fmt"
import math "math"

import io "io"

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.ProtoPackageIsVersion2 // please upgrade the proto package

// Java-specific details used in a CompilationUnit.
// Its type is "kythe.io/proto/kythe.proto.JavaDetails".
type JavaDetails struct {
	// List of classpaths used in the compilation.
	Classpath []string `protobuf:"bytes,1,rep,name=classpath" json:"classpath,omitempty"`
	// List of sourcepaths used in the compilation.
	Sourcepath []string `protobuf:"bytes,2,rep,name=sourcepath" json:"sourcepath,omitempty"`
	// List of bootclasspaths used in the compilation.
	Bootclasspath []string `protobuf:"bytes,3,rep,name=bootclasspath" json:"bootclasspath,omitempty"`
	// List of additional JavaC arguments identified by the extractor as
	// necessary for analysis, but not included in the argument list.
	ExtraJavacopts []string `protobuf:"bytes,10,rep,name=extra_javacopts,json=extraJavacopts" json:"extra_javacopts,omitempty"`
}

func (m *JavaDetails) Reset()                    { *m = JavaDetails{} }
func (m *JavaDetails) String() string            { return proto.CompactTextString(m) }
func (*JavaDetails) ProtoMessage()               {}
func (*JavaDetails) Descriptor() ([]byte, []int) { return fileDescriptorJava, []int{0} }

func (m *JavaDetails) GetClasspath() []string {
	if m != nil {
		return m.Classpath
	}
	return nil
}

func (m *JavaDetails) GetSourcepath() []string {
	if m != nil {
		return m.Sourcepath
	}
	return nil
}

func (m *JavaDetails) GetBootclasspath() []string {
	if m != nil {
		return m.Bootclasspath
	}
	return nil
}

func (m *JavaDetails) GetExtraJavacopts() []string {
	if m != nil {
		return m.ExtraJavacopts
	}
	return nil
}

func init() {
	proto.RegisterType((*JavaDetails)(nil), "kythe.proto.JavaDetails")
}
func (m *JavaDetails) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalTo(dAtA)
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *JavaDetails) MarshalTo(dAtA []byte) (int, error) {
	var i int
	_ = i
	var l int
	_ = l
	if len(m.Classpath) > 0 {
		for _, s := range m.Classpath {
			dAtA[i] = 0xa
			i++
			l = len(s)
			for l >= 1<<7 {
				dAtA[i] = uint8(uint64(l)&0x7f | 0x80)
				l >>= 7
				i++
			}
			dAtA[i] = uint8(l)
			i++
			i += copy(dAtA[i:], s)
		}
	}
	if len(m.Sourcepath) > 0 {
		for _, s := range m.Sourcepath {
			dAtA[i] = 0x12
			i++
			l = len(s)
			for l >= 1<<7 {
				dAtA[i] = uint8(uint64(l)&0x7f | 0x80)
				l >>= 7
				i++
			}
			dAtA[i] = uint8(l)
			i++
			i += copy(dAtA[i:], s)
		}
	}
	if len(m.Bootclasspath) > 0 {
		for _, s := range m.Bootclasspath {
			dAtA[i] = 0x1a
			i++
			l = len(s)
			for l >= 1<<7 {
				dAtA[i] = uint8(uint64(l)&0x7f | 0x80)
				l >>= 7
				i++
			}
			dAtA[i] = uint8(l)
			i++
			i += copy(dAtA[i:], s)
		}
	}
	if len(m.ExtraJavacopts) > 0 {
		for _, s := range m.ExtraJavacopts {
			dAtA[i] = 0x52
			i++
			l = len(s)
			for l >= 1<<7 {
				dAtA[i] = uint8(uint64(l)&0x7f | 0x80)
				l >>= 7
				i++
			}
			dAtA[i] = uint8(l)
			i++
			i += copy(dAtA[i:], s)
		}
	}
	return i, nil
}

func encodeFixed64Java(dAtA []byte, offset int, v uint64) int {
	dAtA[offset] = uint8(v)
	dAtA[offset+1] = uint8(v >> 8)
	dAtA[offset+2] = uint8(v >> 16)
	dAtA[offset+3] = uint8(v >> 24)
	dAtA[offset+4] = uint8(v >> 32)
	dAtA[offset+5] = uint8(v >> 40)
	dAtA[offset+6] = uint8(v >> 48)
	dAtA[offset+7] = uint8(v >> 56)
	return offset + 8
}
func encodeFixed32Java(dAtA []byte, offset int, v uint32) int {
	dAtA[offset] = uint8(v)
	dAtA[offset+1] = uint8(v >> 8)
	dAtA[offset+2] = uint8(v >> 16)
	dAtA[offset+3] = uint8(v >> 24)
	return offset + 4
}
func encodeVarintJava(dAtA []byte, offset int, v uint64) int {
	for v >= 1<<7 {
		dAtA[offset] = uint8(v&0x7f | 0x80)
		v >>= 7
		offset++
	}
	dAtA[offset] = uint8(v)
	return offset + 1
}
func (m *JavaDetails) Size() (n int) {
	var l int
	_ = l
	if len(m.Classpath) > 0 {
		for _, s := range m.Classpath {
			l = len(s)
			n += 1 + l + sovJava(uint64(l))
		}
	}
	if len(m.Sourcepath) > 0 {
		for _, s := range m.Sourcepath {
			l = len(s)
			n += 1 + l + sovJava(uint64(l))
		}
	}
	if len(m.Bootclasspath) > 0 {
		for _, s := range m.Bootclasspath {
			l = len(s)
			n += 1 + l + sovJava(uint64(l))
		}
	}
	if len(m.ExtraJavacopts) > 0 {
		for _, s := range m.ExtraJavacopts {
			l = len(s)
			n += 1 + l + sovJava(uint64(l))
		}
	}
	return n
}

func sovJava(x uint64) (n int) {
	for {
		n++
		x >>= 7
		if x == 0 {
			break
		}
	}
	return n
}
func sozJava(x uint64) (n int) {
	return sovJava(uint64((x << 1) ^ uint64((int64(x) >> 63))))
}
func (m *JavaDetails) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowJava
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= (uint64(b) & 0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: JavaDetails: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: JavaDetails: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 1:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Classpath", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowJava
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= (uint64(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthJava
			}
			postIndex := iNdEx + intStringLen
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Classpath = append(m.Classpath, string(dAtA[iNdEx:postIndex]))
			iNdEx = postIndex
		case 2:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Sourcepath", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowJava
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= (uint64(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthJava
			}
			postIndex := iNdEx + intStringLen
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Sourcepath = append(m.Sourcepath, string(dAtA[iNdEx:postIndex]))
			iNdEx = postIndex
		case 3:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Bootclasspath", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowJava
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= (uint64(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthJava
			}
			postIndex := iNdEx + intStringLen
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Bootclasspath = append(m.Bootclasspath, string(dAtA[iNdEx:postIndex]))
			iNdEx = postIndex
		case 10:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field ExtraJavacopts", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowJava
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= (uint64(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthJava
			}
			postIndex := iNdEx + intStringLen
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.ExtraJavacopts = append(m.ExtraJavacopts, string(dAtA[iNdEx:postIndex]))
			iNdEx = postIndex
		default:
			iNdEx = preIndex
			skippy, err := skipJava(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if skippy < 0 {
				return ErrInvalidLengthJava
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func skipJava(dAtA []byte) (n int, err error) {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return 0, ErrIntOverflowJava
			}
			if iNdEx >= l {
				return 0, io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= (uint64(b) & 0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		wireType := int(wire & 0x7)
		switch wireType {
		case 0:
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowJava
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				iNdEx++
				if dAtA[iNdEx-1] < 0x80 {
					break
				}
			}
			return iNdEx, nil
		case 1:
			iNdEx += 8
			return iNdEx, nil
		case 2:
			var length int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowJava
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				length |= (int(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			iNdEx += length
			if length < 0 {
				return 0, ErrInvalidLengthJava
			}
			return iNdEx, nil
		case 3:
			for {
				var innerWire uint64
				var start int = iNdEx
				for shift := uint(0); ; shift += 7 {
					if shift >= 64 {
						return 0, ErrIntOverflowJava
					}
					if iNdEx >= l {
						return 0, io.ErrUnexpectedEOF
					}
					b := dAtA[iNdEx]
					iNdEx++
					innerWire |= (uint64(b) & 0x7F) << shift
					if b < 0x80 {
						break
					}
				}
				innerWireType := int(innerWire & 0x7)
				if innerWireType == 4 {
					break
				}
				next, err := skipJava(dAtA[start:])
				if err != nil {
					return 0, err
				}
				iNdEx = start + next
			}
			return iNdEx, nil
		case 4:
			return iNdEx, nil
		case 5:
			iNdEx += 4
			return iNdEx, nil
		default:
			return 0, fmt.Errorf("proto: illegal wireType %d", wireType)
		}
	}
	panic("unreachable")
}

var (
	ErrInvalidLengthJava = fmt.Errorf("proto: negative length found during unmarshaling")
	ErrIntOverflowJava   = fmt.Errorf("proto: integer overflow")
)

func init() { proto.RegisterFile("kythe/proto/java.proto", fileDescriptorJava) }

var fileDescriptorJava = []byte{
	// 195 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0xe2, 0x12, 0xcb, 0xae, 0x2c, 0xc9,
	0x48, 0xd5, 0x2f, 0x28, 0xca, 0x2f, 0xc9, 0xd7, 0xcf, 0x4a, 0x2c, 0x4b, 0xd4, 0x03, 0x33, 0x85,
	0xb8, 0xc1, 0xe2, 0x10, 0x8e, 0xd2, 0x2c, 0x46, 0x2e, 0x6e, 0xaf, 0xc4, 0xb2, 0x44, 0x97, 0xd4,
	0x92, 0xc4, 0xcc, 0x9c, 0x62, 0x21, 0x19, 0x2e, 0xce, 0xe4, 0x9c, 0xc4, 0xe2, 0xe2, 0x82, 0xc4,
	0x92, 0x0c, 0x09, 0x46, 0x05, 0x66, 0x0d, 0xce, 0x20, 0x84, 0x80, 0x90, 0x1c, 0x17, 0x57, 0x71,
	0x7e, 0x69, 0x51, 0x72, 0x2a, 0x58, 0x9a, 0x09, 0x2c, 0x8d, 0x24, 0x22, 0xa4, 0xc2, 0xc5, 0x9b,
	0x94, 0x9f, 0x5f, 0x82, 0x30, 0x81, 0x19, 0xac, 0x04, 0x55, 0x50, 0x48, 0x9d, 0x8b, 0x3f, 0xb5,
	0xa2, 0xa4, 0x28, 0x31, 0x1e, 0xe4, 0xa8, 0xe4, 0xfc, 0x82, 0x92, 0x62, 0x09, 0x2e, 0xb0, 0x3a,
	0x3e, 0xb0, 0xb0, 0x17, 0x4c, 0xd4, 0xc9, 0xf0, 0xc4, 0x23, 0x39, 0xc6, 0x0b, 0x8f, 0xe4, 0x18,
	0x1f, 0x3c, 0x92, 0x63, 0x9c, 0xf1, 0x58, 0x8e, 0x81, 0x4b, 0x3e, 0x39, 0x3f, 0x57, 0x2f, 0x3d,
	0x3f, 0x3f, 0x3d, 0x27, 0x55, 0x2f, 0x25, 0xb5, 0xac, 0x24, 0x3f, 0x3f, 0xa7, 0x58, 0x0f, 0xc9,
	0x3f, 0x49, 0x6c, 0x60, 0xca, 0x18, 0x10, 0x00, 0x00, 0xff, 0xff, 0x42, 0x70, 0xb1, 0x9a, 0xfd,
	0x00, 0x00, 0x00,
}